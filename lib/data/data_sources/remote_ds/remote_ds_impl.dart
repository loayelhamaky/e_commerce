import 'dart:convert';
import 'package:e_commerce_app/data/data_sources/remote_ds/remote_ds.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/end_points.dart';
import '../../models/auth/auth_response.dart';
import '../../utils/shared_prefs_utils.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  SharedPrefsUtils sharedPrefsUtils;
  AuthRemoteDsImpl(this.sharedPrefsUtils);
  @override
  Future login(String email, String password) async {
    Uri url = Uri.parse(EndPoints.login);
    final Map<String, String> loginBody = {
      'email': email,
      'password': password
    };
    if (kDebugMode) {
      print('Sending request to ${url.toString()} with body: $loginBody');
    }
    Response apiResponse = await post(url, body: loginBody);
    AuthResponse authResponse =
        AuthResponse.fromJson(jsonDecode(apiResponse.body));
    if (kDebugMode) {
      print(
        'Received response with status: ${apiResponse.statusCode} and body: ${apiResponse.body}');
    }

    if (apiResponse.statusCode < 300 &&
        apiResponse.statusCode >= 200 &&
        authResponse.token != null) {
      if (kDebugMode) {
        print('login successfully');
      }
      sharedPrefsUtils.saveToken(authResponse.token!);
      return;
    } else {
      if (kDebugMode) {
        print('failed with message: ${authResponse.message}');
      }
      throw (authResponse.message ?? AppStrings.errorDefaultMessage);
    }
  }

  @override
  Future register(
      String email, String password, String userName, String mobileNum) async {
    Uri url = Uri.parse(EndPoints.register);
    final Map<String, String> signUpBody = {
      "name": userName,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": mobileNum
    };

    if (kDebugMode) {
      print('Sending request to ${url.toString()} with body: $signUpBody');
    }

    Response apiResponse = await post(url, body: signUpBody);

    if (kDebugMode) {
      print(
        'Received response with status: ${apiResponse.statusCode} and body: ${apiResponse.body}');
    }

    AuthResponse authResponse =
        AuthResponse.fromJson(jsonDecode(apiResponse.body));

    if (apiResponse.statusCode < 300 &&
        apiResponse.statusCode >= 200 &&
        authResponse.token != null) {
      sharedPrefsUtils.saveToken(authResponse.token!);
      AppStrings.myToken = authResponse.token!;
      if (kDebugMode) {
        print('Registration successful');
      }
      return;
    } else {
      if (kDebugMode) {
        print('Registration failed with message: ${authResponse.message}');
      }
      throw (authResponse.message ?? AppStrings.errorDefaultMessage);
    }
  }
}
