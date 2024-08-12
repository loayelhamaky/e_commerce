import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/end_points.dart';
import '../../../data/data_sources/local_ds/local_ds.dart';
import '../../../data/data_sources/remote_ds/remote_ds.dart';
import '../../../data/models/categories/categories_response.dart';
import '../../../data/models/products/product_response.dart';
import 'main_repo.dart';

@Injectable(as: MainRepo)
class CategoriesRepoImpl extends MainRepo {
  final AuthRemoteDs remoteDs;
  final AuthLocalDs localDs;
  final InternetConnectionChecker internetConnectionChecker;
  CategoriesRepoImpl(this.remoteDs, this.localDs,this.internetConnectionChecker);

  @override
  Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.parse(EndPoints.categories);
    print('Fetching categories from API: $url');
    var serverResponse = await get(url);
    print('Received response: ${serverResponse.statusCode}');
    print('Response body: ${serverResponse.body}');

    CategoriesResponse categoriesResponse =
    CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
    if (serverResponse.statusCode < 300 &&
        serverResponse.statusCode >= 200 &&
        serverResponse.body.isNotEmpty) {
      print('Success: Categories response received');
      print('Categories data: ${categoriesResponse.categoryData}');
      return categoriesResponse;
    } else {
      print('Error: Failed to fetch categories with status code ${serverResponse.statusCode}');
      throw (AppStrings.errorDefaultMessage);
    }
  }

  @override
  Future<ProductResponse> getProducts() async {
    print('Fetching products from API');
    Uri url = Uri.parse(EndPoints.products);
    var serverResponse = await get(url);
    print('Received response: ${serverResponse.statusCode}');
    print('Response body: ${serverResponse.body}');

    ProductResponse productResponse =
    ProductResponse.fromJson(jsonDecode(serverResponse.body));
    if (serverResponse.statusCode < 300 &&
        serverResponse.statusCode >= 200 &&
        serverResponse.body.isNotEmpty) {
      print('Success: Product response received');
      print('Product data: ${productResponse.productData}');
      return productResponse;
    } else {
      print('Error: Failed to fetch products with status code ${serverResponse.statusCode}');
      throw (AppStrings.errorDefaultMessage);
    }
  }

}
