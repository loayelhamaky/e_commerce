import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/models/products/product_dm.dart';
import 'package:e_commerce_app/data/models/wishlist/wishlist_update_response.dart';
import 'package:e_commerce_app/data/models/wishlist/wishlist_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/products/product_response.dart';

abstract class WishListRepo{
  Future<Either<String, WishListResponse>> getUserWishList();
  Future<void> addProductToWishList(String id);
  Future<void> removeFromWishList(String id);
  Stream<List<String>> getWishlistIdsStream();
  }