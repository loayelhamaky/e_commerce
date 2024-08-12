import 'package:flutter/material.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_text_styles.dart';
import '../register/view.dart';

class LoginWidgets {

  static Widget routeImgInLogin(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(AppAssets.routeLogoRegistration),
          ),
        ),
      ],
    );
  }

  static Widget loginWelcomeTitle(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Welcome Back To Route',
            style: AppTextStyles.registrationHeading.copyWith(color: Colors.white),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16, top: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Please sign in with your mail',
            style: AppTextStyles.registrationDescription,
          ),
        ),
      ],
    );
  }

  static Widget createAccountLine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
            style: AppTextStyles.registrationDescription),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
                context, RegisterScreen.routeName);
          },
          child: const Text(
            'Create Account',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
