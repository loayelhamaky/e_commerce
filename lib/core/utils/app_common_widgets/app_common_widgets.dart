import 'package:e_commerce_app/presentation/main_screen/view/main_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppCommonWidgets {
  static PreferredSizeWidget productDetailsAndCartAppBar(
      String title, BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,
          style: AppTextStyles.heading
              .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w700)),
      leading: IconButton(
        iconSize: 30.sp,
        color: AppColors.primary,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        },
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
        // IconButton(
        //   iconSize: 30.sp,
        //   color: AppColors.primary,
        //   icon: const Icon(IconlyLight.buy),
        //   onPressed: () {
        //     Navigator.pushNamed(context, MainScreen.routeName);
        //   },
        // ),
      ],
    );
  }

  static Widget cupertinoLoadingWidget(BuildContext context) {
    return const Center(
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoActivityIndicator(
                radius: 20.0,
                color: AppColors.primary, // Use your custom color here
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget homeLoadingWidget(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: const Column(
          children: [
            Expanded(flex: 25, child: SizedBox()),
            CupertinoActivityIndicator(
              radius: 20.0,
              color: AppColors.black, // Use your custom color here
            ),
            SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(color: AppColors.black),
            ),
            Expanded(flex: 75, child: SizedBox())
          ],
        ),
      ),
    );
  }

  static Widget emptyListWidget(
      BuildContext context, String listName, String animationAsset) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      height: MediaQuery.of(context).size.height * 0.65,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Lottie.asset(
                      animationAsset,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    'Your $listName is empty',
                    style: AppTextStyles.heading
                        .copyWith(color: AppColors.appText, fontSize: 24.sp),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Looks like you haven\'t added anything\n '
                        'to your $listName yet.',
                    style: AppTextStyles.medium.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
