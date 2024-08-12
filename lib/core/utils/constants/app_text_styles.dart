import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle registrationHeading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle registrationDescription = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle heading = TextStyle(
    fontSize: 20.sp,
    color: AppColors.appText,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );
  static TextStyle medium = TextStyle(
    fontSize: 16.sp,
    color: AppColors.appText,
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

}
