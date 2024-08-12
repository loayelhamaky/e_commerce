
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../presentation/main_screen/view/screens/cart/cart_view.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppCommonWidgets{
  static productDetailsAndCartAppBar(String title, BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text('Product Details', style: AppTextStyles.heading.copyWith(fontSize: 24.sp,fontWeight: FontWeight.w700)),
      leading: IconButton(
        iconSize: 30.sp,
        color: AppColors.primary,
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          iconSize: 30.sp,
          color: AppColors.primary,
          icon: const Icon(IconlyLight.search),
          onPressed: () {
            ////////////////////////////////////////
          },
        ),
        IconButton(
          iconSize: 30.sp,
          color: AppColors.primary,
          icon: const Icon(IconlyLight.buy),
          onPressed: () {
            Navigator.pushNamed(context, CartView.routeName);
          },
        ),
      ],
    );
  }

  static Widget loadingWidget(BuildContext context){
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            // Expanded(child: SizedBox()),
            CupertinoActivityIndicator(
              radius: 20.0,
              color: AppColors.black, // Use your custom color here
            ),
            SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(color: AppColors.black),
            ),
            Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }

  static Widget homeLoadingWidget(BuildContext context){
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            Expanded(
                flex: 25,
                child: SizedBox()),
            CupertinoActivityIndicator(
              radius: 20.0,
              color: AppColors.black, // Use your custom color here
            ),
            SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(color: AppColors.black),
            ),
            Expanded(
                flex: 75,
                child: SizedBox())
          ],
        ),
      ),
    );
  }



}