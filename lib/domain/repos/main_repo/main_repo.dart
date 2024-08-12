
import '../../../data/models/categories/categories_response.dart';
import '../../../data/models/products/product_response.dart';

abstract class MainRepo{
  Future<CategoriesResponse> getCategories();
  Future<ProductResponse> getProducts();
}