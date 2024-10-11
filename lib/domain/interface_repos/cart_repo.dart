import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/cart/add_to_cart_response.dart';
import 'package:e_commerce_app/data/models/cart/remove_update_quantity_response.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/cart/cart_dm.dart';

abstract class CartRepo {
  @factoryMethod
  Future<Either<String, CartDM>> getUserCart();
  Future<Either<String, AddToCartResponse>> addCartProduct(String id);
  Future<Either<String, RemoveOrUpdateQuantityResponse>> removeCartProduct(String id);
  Future<Either<String, RemoveOrUpdateQuantityResponse>> updateProductQuantity(String id, int count);
  Stream<List<String>> getCartIdsStream();
  Stream<int> getTotalPriceStream();
}
