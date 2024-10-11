import 'package:e_commerce_app/core/utils/constants/app_colors.dart';
import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_text_styles.dart';
import '../register/view.dart';

class LoginWidgets {
  Widget routeImgInLogin(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(AppAssets.routeLogoRegistration),
          ),
        ),
      ],
    );
  }

  Widget loginWelcomeTitle(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Welcome Back To Route',
            style:
                AppTextStyles.registrationHeading.copyWith(color: Colors.white),
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

  Widget createAccountLine(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?",
              style: AppTextStyles.registrationDescription),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: Text(
              'Create Account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  loginWithAccWidget(VoidCallback onGoogleTap, VoidCallback onFacebookTap,
      VoidCallback onSmsTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          Text(
            'Continue With existing account?',
            style: AppTextStyles.medium
                .copyWith(color: Colors.white.withOpacity(0.8)),
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    onGoogleTap();
                  },
                  child: Container(
                    height: 66.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Colors.transparent),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AppAssets.googleIcon,
                          )),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    onFacebookTap();
                  },
                  child: Container(
                    height: 76.h,
                    width: 76.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Colors.transparent),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AppAssets.facebookIcon,
                          )),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    onSmsTap();
                  },
                  child: Container(
                    height: 66.h,
                    width: 66.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Colors.transparent),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            AppAssets.smsIcon,/**/
                          )),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
