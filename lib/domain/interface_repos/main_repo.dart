import 'package:dartz/dartz.dart';
import '../../data/models/categories/home_screen_categories/home_categories_response.dart';
import '../../data/models/products/product_response.dart';

abstract class MainRepo{
  Future<Either<String , HomeCategoriesResponse>> getHomeCategories();
  Future<Either<String, ProductResponse>> getProducts();
}