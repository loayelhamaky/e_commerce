import 'package:e_commerce_app/core/utils/constants/app_colors.dart';
import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:e_commerce_app/core/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutWidget extends StatelessWidget {
  final int totalPrice;
  final Function onCheckOut;

  const CheckoutWidget(
      {super.key, required this.totalPrice, required this.onCheckOut});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.04,
          top: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppStrings.totalPrice,
                style: AppTextStyles.medium.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'EGP ${totalPrice.toStringAsFixed(2)}',
                style: AppTextStyles.heading,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              onCheckOut();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              fixedSize: Size.fromWidth(
                  MediaQuery.of(context).size.width * 0.5), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppStrings.checkOut,
                  style: AppTextStyles.heading
                      .copyWith(color: Colors.white, fontSize: 20.sp),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 26.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
