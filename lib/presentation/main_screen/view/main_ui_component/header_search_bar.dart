import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../screens/cart/cart_view.dart';


class HeaderSearchBar extends StatelessWidget {
  const HeaderSearchBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          /// route image
          Container(
            height: 70.h,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 30.h,bottom: 4),
            child: Image.asset(
              AppAssets.routeLogoMain,
              //AppAssets.routeImage,
              // height: 100.h,
              //width: AppDimensions.routeWordSize,
            ),
          ),
          /// search and cart
          Row(
            children: [
              Expanded(
                flex: 87,
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
                  onChanged: (query) {

                  },
                ),
              ),
              Expanded(
                flex: 13,
                child: Container(
                  margin:  EdgeInsets.only(left: 8.w),
                  child: IconButton(
                    onPressed: () {
                       Navigator.pushNamed(context, CartView.routeName);
                    },
                    icon: Icon(
                      IconlyLight.buy,
                      size: 34.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
