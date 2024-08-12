import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../core/utils/constants/app_text_styles.dart';

class ProductDetailsWidgets{
  static imageStack(String image){
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                image ,
                height: 300.h,
                width: 200.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 50,
                ),
              ),
              Positioned(
                top: 14.h,
                right: 6.w,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
          ///////////////////////////////////
                    },
                    child: Icon(
                      IconlyLight.heart,
                      color: AppColors.primary,
                      size: 26.sp, // Set icon size
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  static titleAndPrice(String title, double price){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(title ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTextStyles.heading),
            ),
            Expanded(
              child: Text('EGP ${price}',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.heading),
            ),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  static soldAndRatings(double sold, double ratingsAverage){
    return Column(
      children: [
        Row(
          children: [
            Chip(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: const BorderSide(color: AppColors.primary)),
              label: Text('$sold Sold',
                  style:
                  AppTextStyles.heading.copyWith(fontSize: 16.sp)),
            ),
            SizedBox(width: 8.w),
            Row(
              children: [
                Icon(IconlyBold.star, color: Colors.amber, size: 22.sp),
                Text(' $ratingsAverage (7,500)',
                    style: AppTextStyles.medium.copyWith(fontSize: 17.sp)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}