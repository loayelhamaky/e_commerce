import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/vm/home_vm.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/view/widgets/product_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../core/utils/constants/app_text_styles.dart';
import '../arguments/product_arguments.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'product details';
  const ProductDetailsView({ super.key});
  @override
  Widget build(BuildContext context) {
    var productArguments =
        ModalRoute.of(context)!.settings.arguments as ProductCardArguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppCommonWidgets.productDetailsAndCartAppBar(
            AppStrings.productDetails, context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.h),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsWidgets.imageStack(
                    productArguments.imageUrl, context),
                ProductDetailsWidgets.titleAndPrice(
                    productArguments.title, productArguments.price),
                ProductDetailsWidgets.soldAndRatings(
                    productArguments.sold,
                    productArguments.ratingsAverage,
                    productArguments.ratingQuantity),
                Text('Description', style: AppTextStyles.heading),
                Text(productArguments.description,
                    style: AppTextStyles.medium.copyWith()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
