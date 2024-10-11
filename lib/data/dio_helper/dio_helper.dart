import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/error/error_strings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../core/utils/error/error_dio_helper.dart';
import '../shared_prefs_utils/shared_prefs_utils.dart';

class AppDioInterceptor extends Interceptor {
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  bool requiresToken;

  AppDioInterceptor({required this.requiresToken});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await connectionChecker.hasConnection) {
      return handler.reject(DioException(
        requestOptions: options,
        error: ErrorStrings.internetErrorMessage,
        type: DioExceptionType.connectionError,
      ));
    }

    String? token = await SharedPrefsUtils.getApiToken();
    if (token != null) {
      requiresToken ? options.headers['token'] = token : null;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('got response from api');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String errorMessage = DioErrorHelper.handleDioError(err);
    print("Dio error occurred: $errorMessage");
    handler.next(err);
  }
}
