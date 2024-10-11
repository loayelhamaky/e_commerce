import 'package:e_commerce_app/presentation/main_screen/view/main_screen_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_strings.dart';
// import '../screens/cart/cart_view.dart';

class HeaderSearchBar extends StatelessWidget {
  const HeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          /// route image
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 30.h, bottom: 4),
            child: Image.asset(
              AppAssets.routeLogoMain,
            ),
          ),

          /// search and cart
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.064,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      helperMaxLines: 1,
                      hintText: AppStrings.hintSearch,
                      prefixIcon: Icon(
                        IconlyLight.search,
                        size: 30.sp,
                        color: AppColors.primary,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    onChanged: (query) {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
