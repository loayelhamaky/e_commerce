import 'package:e_commerce_app/core/utils/constants/app_colors.dart';
import 'package:e_commerce_app/core/utils/constants/app_text_styles.dart';
import 'package:e_commerce_app/data/shared_prefs_utils/shared_prefs_utils.dart';
import 'package:e_commerce_app/presentation/auth_screens/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
          onPressed: () async {
            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
            await SharedPrefsUtils.deleteApiToken();
          },
          child: Text(
            'Logout',
            style: AppTextStyles.heading.copyWith(color: Colors.white),
          )),
    );
  }
}
