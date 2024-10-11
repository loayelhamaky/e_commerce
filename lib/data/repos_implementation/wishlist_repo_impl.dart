import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/constants/end_points.dart';
import 'package:e_commerce_app/data/models/wishlist/wishlist_update_response.dart';
import 'package:e_commerce_app/data/models/wishlist/wishlist_response.dart';
import 'package:injectable/injectable.dart';
import '../../core/utils/error/error_dio_helper.dart';
import '../../domain/interface_repos/wishlist_repo.dart';
import '../dio_helper/dio_helper.dart';

@Singleton(as: WishListRepo)
class WishlistRepoImpl extends WishListRepo {
  static StreamController<List<String>> wishlistIdsStreamController = StreamController.broadcast();

  late Dio _dio;

  WishlistRepoImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: EndPoints.wishList,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(AppDioInterceptor(requiresToken: true));
  }

  @override
  Future<Either<String, WishListResponse>> getUserWishList() async {
    try {
      final response = await _dio.get(EndPoints.wishList);

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        WishListResponse wishListResponse = WishListResponse.fromJson(response.data);

        List<String> wishlistProductIds = wishListResponse.wishListProducts.map((product) => product.id).toList();
        wishlistIdsStreamController.add(wishlistProductIds);

        return Right(wishListResponse);
      }
      return Left(DioErrorHelper.handleDioError(DioException(
        requestOptions: response.requestOptions,
        error: response.data,
        response: response,
      )));
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, WishlistUpdateResponse>> addProductToWishList(String id) async {
    try {
      final response = await _dio.post(EndPoints.wishList, data: {'productId': id});

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        WishlistUpdateResponse updateResponse = WishlistUpdateResponse.fromJson(response.data);
        wishlistIdsStreamController.add(updateResponse.wishListProductIds);
        return Right(updateResponse);
      }
      return Left(DioErrorHelper.handleDioError(DioException(
        requestOptions: response.requestOptions,
        error: response.data,
        response: response,
      )));
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, WishlistUpdateResponse>> removeFromWishList(String id) async {
    try {
      final response = await _dio.delete("${EndPoints.wishList}/$id");

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        WishlistUpdateResponse updateResponse = WishlistUpdateResponse.fromJson(response.data);
        wishlistIdsStreamController.add(updateResponse.wishListProductIds);
        return Right(updateResponse);
      }
      return Left(DioErrorHelper.handleDioError(DioException(
        requestOptions: response.requestOptions,
        error: response.data,
        response: response,
      )));
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Stream<List<String>> getWishlistIdsStream() {
    return wishlistIdsStreamController.stream;
  }
}
