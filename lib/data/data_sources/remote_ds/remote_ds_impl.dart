import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/data_sources/remote_ds/remote_ds.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/utils/constants/end_points.dart';
import '../../../core/utils/error/error_strings.dart';
import '../../models/auth/auth_response.dart';
import '../../shared_prefs_utils/shared_prefs_utils.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  late Dio _dio;
  SharedPrefsUtils sharedPrefsUtils;
  AuthRemoteDsImpl(this.sharedPrefsUtils) {
    _dio = Dio(BaseOptions(
      baseUrl: EndPoints.register,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('request ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("got response ${response.data}");
        return handler.next(response);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          print("Unauthorized! Refresh token maybe?");
        } else {
          print("Error occurred: ${error.message}");
        }
        return handler.next(error);
      },
    ));
  }

  @override
  Future register(
      String email, String password, String userName, String mobileNum) async {
    String url = EndPoints.register;
    final Map<String, String> signUpBody = {
      "name": userName,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": mobileNum
    };

    Response apiResponse = await _dio.post(url, data: signUpBody);
    AuthResponse authResponse = AuthResponse.fromJson(apiResponse.data);
    if (apiResponse.statusCode != null &&
        apiResponse.statusCode! < 300 &&
        apiResponse.statusCode! >= 200 &&
        authResponse.token != null) {
      await SharedPrefsUtils.saveApiToken(authResponse.token!);
      print(" api token is ${authResponse.token!}");
      return;
    } else {
      if (kDebugMode) {
        print('Registration failed with message: ${authResponse.message}');
      }
      throw (authResponse.message ?? ErrorStrings.errorDefaultMessage);
    }
  }

  @override
  Future<void> login(String email, String password) async {
    String url = EndPoints.login;
    final Map<String, String> loginBody = {
      'email': email,
      'password': password
    };
    Response response = await _dio.post(url, data: loginBody);
    AuthResponse loginResponse = AuthResponse.fromJson(response.data);
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300 &&
        loginResponse.token != null) {
      await SharedPrefsUtils.saveApiToken(loginResponse.token!);
      return;
    } else {
      throw (loginResponse.message ?? ErrorStrings.errorDefaultMessage);
    }
  }
}

