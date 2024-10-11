import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/constants/end_points.dart';
import 'package:e_commerce_app/core/utils/error/error_dio_helper.dart';
import 'package:e_commerce_app/data/dio_helper/dio_helper.dart';
import 'package:e_commerce_app/data/models/cart/add_to_cart_response.dart';
import 'package:e_commerce_app/data/models/cart/cart_dm.dart';
import 'package:e_commerce_app/data/models/cart/get_user_cart_response.dart';
import 'package:e_commerce_app/data/models/cart/remove_update_quantity_response.dart';
import 'package:injectable/injectable.dart';
import '../../core/utils/error/error_strings.dart';
import '../../domain/interface_repos/cart_repo.dart';

@Singleton(as: CartRepo)
class CartRepoImpl extends CartRepo {
  static StreamController<List<String>> cartIdsStreamController =
      StreamController.broadcast();
  static StreamController<int> totalPriceStreamController =
      StreamController.broadcast();

  late Dio _dio;

  CartRepoImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: EndPoints.cart,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(AppDioInterceptor(requiresToken: true));
  }

  @override
  Future<Either<String, CartDM>> getUserCart() async {
    try {
      final response = await _dio.get(EndPoints.cart);

      GetUserCartResponse cartResponse =
          GetUserCartResponse.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        List<String> cartProductIds = cartResponse.cartDm!.cartProductsDetails
            .map((cartProductDetails) => cartProductDetails.product!.id)
            .toList();

        /// ids listened by home, wishlist, productDetails
        cartIdsStreamController.add(cartProductIds);
        totalPriceStreamController.add(cartResponse.cartDm!.totalCartPrice!);
        return Right(cartResponse.cartDm!);
      }
      throw DioException(
        requestOptions: response.requestOptions,
        error:
            cartResponse.message?.toString() ?? ErrorStrings.badRequestMessage,
      );
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, AddToCartResponse>> addCartProduct(String id) async {
    try {
      Response response =
          await _dio.post(EndPoints.cart, data: {'productId': id});
      AddToCartResponse cartResponse =
          AddToCartResponse.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        cartIdsStreamController.add(cartResponse.data!.products
            .map((product) => product.productId!)
            .toList());

        totalPriceStreamController.add(cartResponse.data!.totalCartPrice!);
        return Right(cartResponse);
      }
      throw DioException(
        requestOptions: response.requestOptions,
        error:
            cartResponse.message?.toString() ?? ErrorStrings.badRequestMessage,
      );
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, RemoveOrUpdateQuantityResponse>> removeCartProduct(
      String id) async {
    try {
      Response response = await _dio.delete("${EndPoints.cart}/$id");
      RemoveOrUpdateQuantityResponse cartResponse =
          RemoveOrUpdateQuantityResponse.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        cartIdsStreamController.add(cartResponse.data!.products
            .map((productDetails) => productDetails.product!.id)
            .toList());

        totalPriceStreamController.add(cartResponse.data!.totalCartPrice!);
        return Right(cartResponse);
      }
      throw DioException(
        requestOptions: response.requestOptions,
        error:
            cartResponse.message?.toString() ?? ErrorStrings.badRequestMessage,
      );
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, RemoveOrUpdateQuantityResponse>> updateProductQuantity(
      String id, int count) async {
    try {
      Response response = await _dio.put(
        '${EndPoints.cart}/$id',
        data: {'count': count.toString()},
      );
      RemoveOrUpdateQuantityResponse cartResponse =
          RemoveOrUpdateQuantityResponse.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        cartIdsStreamController.add(cartResponse.data!.products
            .map((cartProductDetails) => cartProductDetails.product!.id)
            .toList());

        totalPriceStreamController.add(cartResponse.data!.totalCartPrice!);
        return Right(cartResponse);
      }
      throw DioException(
        requestOptions: response.requestOptions,
        error:
            cartResponse.message?.toString() ?? ErrorStrings.badRequestMessage,
      );
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Stream<List<String>> getCartIdsStream() {
    return cartIdsStreamController.stream;
  }

  @override
  Stream<int> getTotalPriceStream() {
    return totalPriceStreamController.stream;
  }
}
