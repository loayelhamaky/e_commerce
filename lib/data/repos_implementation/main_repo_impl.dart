import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/constants/end_points.dart';
import '../../../core/utils/error/error_dio_helper.dart';
import '../../../data/models/products/product_response.dart';
import '../../domain/interface_repos/main_repo.dart';
import '../dio_helper/dio_helper.dart';
import '../models/categories/home_screen_categories/home_categories_response.dart';
import '../shared_prefs_utils/shared_prefs_utils.dart';

@Singleton(as: MainRepo)
class MainRepoImpl extends MainRepo {
  late Dio _dio;

  MainRepoImpl() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(AppDioInterceptor(requiresToken: true));
  }

  @override
  Future<Either<String, HomeCategoriesResponse>> getHomeCategories() async {

    var token = await SharedPrefsUtils.getApiToken();
    print(token);
    print('object');
    try {
      final response = await _dio.get(EndPoints.categories);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        HomeCategoriesResponse categoriesResponse =
            HomeCategoriesResponse.fromJson(response.data);
        return Right(categoriesResponse);
      } else {
        return Left(DioErrorHelper.handleDioError(DioException(
          requestOptions: response.requestOptions,
          error: response.data,
          response: response,
        )));
      }
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }

  @override
  Future<Either<String, ProductResponse>> getProducts() async {
    try {
      final response = await _dio.get(EndPoints.products);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return Right(productResponse);
      } else {
        return Left(DioErrorHelper.handleDioError(DioException(
          requestOptions: response.requestOptions,
          error: response.data,
          response: response,
        )));
      }
    } catch (e) {
      return Left(DioErrorHelper.handleGeneralError(e));
    }
  }
}
