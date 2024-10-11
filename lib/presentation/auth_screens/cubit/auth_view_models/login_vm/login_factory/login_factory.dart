import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/facebook_login.dart';
import 'package:e_commerce_app/presentation/auth_screens/cubit/auth_view_models/login_vm/login_factory/sms_login.dart';
import 'package:flutter/material.dart';
import 'google_login.dart';
import 'email_and_pass_login.dart';

abstract class LoginFactory {
  void login();

  factory LoginFactory({
    required LoginType type,
    BuildContext? context,
    String? verificationId,
    String? email,
    String? password,
  }) {
    switch (type) {
      case LoginType.google:
        return LoginWithGoogle();
      case LoginType.facebook:
        return LoginWithFacebook();
      case LoginType.emailAndPassword:
        assert(email != null && password != null,
            'Email and Password are required for email login.');
        return LoginWithEmailAndPass(email!, password!);
      case LoginType.sms:
        assert(context != null && verificationId != null,
            'Context and verificationId are required for SMS login.');
        return LoginWithSms(context!, verificationId!);
      default:
        throw Exception("Unsupported login type");
    }
  }
}

enum LoginType { emailAndPassword, google, facebook, sms }
