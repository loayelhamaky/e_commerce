import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/home_ui_content/home_appliance/product_card/product_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../../../core/utils/constants/app_text_styles.dart';
import '../../../../../../../../data/models/products/product_dm.dart';

class HomeAppliance extends StatefulWidget {
  const HomeAppliance(
      {super.key, required this.products});
  final List<ProductDM> products;

  @override
  State<HomeAppliance> createState() => _State();
}

class _State extends State<HomeAppliance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, top: 12.h, bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(AppStrings.homeAppliance,
                  style: AppTextStyles.heading, textAlign: TextAlign.start)),

          ///
          SizedBox(
            height: 275.h,
            width: double.infinity,
            child: GridView.builder(
              itemCount: widget.products.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.15,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  crossAxisCount: 1),
              itemBuilder: (context, index) => ProductCard(
                product: widget.products[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
