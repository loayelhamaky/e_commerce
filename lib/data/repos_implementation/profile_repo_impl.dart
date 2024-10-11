import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/dio_helper/dio_helper.dart';
import 'package:e_commerce_app/domain/interface_repos/profile_repo.dart';
import 'package:injectable/injectable.dart';
import '../../core/utils/constants/end_points.dart';
import '../../core/utils/error/error_dio_helper.dart';
import '../models/user/user.dart';
import '../models/user/user_response.dart';

@Singleton(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {
  late Dio _dio;
  ProfileRepoImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: EndPoints.updateUserData,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ));
    _dio.interceptors.add(
        AppDioInterceptor(requiresToken: true)
    );
  }
  @override
  Future<Either<String, AppUser?>> updateUserData(
      {String? name, String? email}) async {
    /// api doesn't have phone or address so handled by sharedPrefs
    String url = EndPoints.updateUserData;
    Map<String, dynamic> requestData = {};
    if (name != null && name.isNotEmpty) {
      requestData['name'] = name;
    }
    if (email != null && email.isNotEmpty) {
      requestData['email'] = email;
    }

    final response = await _dio.put(url, data: requestData);
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      UserResponse userResponse = UserResponse.fromJson(response.data);
      return Right(userResponse.user);
    } else {
      return Left(DioErrorHelper.handleDioError(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
        ),
      ));
    }
  }
}
