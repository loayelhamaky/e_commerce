import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/app_text_styles.dart';

class AuthCommonWidgets {
  static Widget textFieldTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 25, bottom: 10),
      child: Text(
        title,
        style: AppTextStyles.registrationDescription.copyWith(fontSize: 20),
      ),
    );
  }

  static customTextFormField(String hint, TextEditingController controller,
      String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      maxLines: 2,
      decoration: InputDecoration(
          hintText: hint,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 15),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: const EdgeInsets.only(left: 12, top: 12, bottom: 9),
          isDense: true),
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Poppins',
      ),
    );
  }

  static Widget textFieldDescription(String description,
      {double topMargin = 25}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: topMargin, bottom: 10),
      child: Text(
        description,
        style: AppTextStyles.registrationDescription.copyWith(fontSize: 20),
      ),
    );
  }

  static registerButton(
      String title, VoidCallback onTap, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 66.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        onPressed: onTap,
        child: Text(title,
            style: AppTextStyles.registrationHeading
                .copyWith(color: AppColors.primary)),
      ),
    );
  }
}
