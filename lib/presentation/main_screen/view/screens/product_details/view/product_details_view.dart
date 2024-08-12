import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/view/widgets/product_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_text_styles.dart';
import '../arguments/product_arguments.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'product details';
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var productArguments =
    ModalRoute.of(context)!.settings.arguments as ProductCardArguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppCommonWidgets.productDetailsAndCartAppBar(
            AppStrings.productDetails, context),
        body: Padding(
          padding: EdgeInsets.all(16.h),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsWidgets.imageStack(productArguments.imageUrl),
                  ProductDetailsWidgets.titleAndPrice(
                      productArguments.title, productArguments.price),
                  ProductDetailsWidgets.soldAndRatings(
                      productArguments.sold, productArguments.ratingsAverage),
                  Text('Description', style: AppTextStyles.heading),
                  Text(productArguments.description ?? '',
                      style: AppTextStyles.medium.copyWith()),
                  SizedBox(height: 16.h),
                  Row(
                    children: productArguments.availableColors
                        .map((color) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: ChoiceChip(
                        backgroundColor: color,
                        label: const Text(''),
                        selected: false,
                      ),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 16.h),

                  Spacer(), // Add this to push the below content to the bottom

                  // Total price and add to cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total price\nEGP ${productArguments.price}',
                          style: AppTextStyles.medium),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Add to cart'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          textStyle: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
