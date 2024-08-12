import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_text_styles.dart';

class CartView extends StatelessWidget {
  static const String routeName = 'cart';
  final String? imageUrl;
  final String? productName;
  final double? price;
  final String? color;
  final int? size;
  final int? quantity;

  const CartView({
    Key? key,
    this.imageUrl,
    this.productName,
    this.price,
    this.color,
    this.size,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: AppTextStyles.heading),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: Icon(IconlyLight.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(IconlyLight.buy),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Cart Item
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(
                        imageUrl ?? '',
                        height: 50.h,
                        width: 50.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.error, size: 50.h);
                        },
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productName ?? '', style: AppTextStyles.heading),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 5.w,
                                  backgroundColor: _getColorFromString(color),
                                ),
                                SizedBox(width: 8.w),
                                Text('Color: $color | Size: $size', style: AppTextStyles.medium.copyWith(fontSize: 10.sp)),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text('EGP $price', style: AppTextStyles.medium),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: AppColors.primary),
                            onPressed: () {
                              // Handle delete
                            },
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline, color: AppColors.primary),
                                onPressed: () {
                                  // Handle decrease quantity
                                },
                              ),
                              Text('$quantity', style: AppTextStyles.heading),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline, color: AppColors.primary),
                                onPressed: () {
                                  // Handle increase quantity
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              // Total Price and Checkout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total price', style: AppTextStyles.medium),
                    SizedBox(height: 8.h),
                    Text('EGP $price', style: AppTextStyles.medium),
                    SizedBox(height: 16.h),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle checkout
                      },
                      icon: Icon(Icons.shopping_cart),
                      label: Text('Check Out'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        backgroundColor: AppColors.primary,
                        textStyle: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromString(String? colorName) {
    switch (colorName?.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
