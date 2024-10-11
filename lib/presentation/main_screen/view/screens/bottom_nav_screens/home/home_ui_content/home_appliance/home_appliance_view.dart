import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/data/shared_prefs_utils/shared_prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/utils/app_common_widgets/product_card/product_card_view.dart';
import '../../../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../../../core/utils/constants/app_text_styles.dart';
import '../../../../../../../../data/models/products/product_dm.dart';
class HomeAppliance extends StatefulWidget {
  const HomeAppliance(
      {super.key,
        required this.products,
        required this.onUpdateWishlist,
        required this.wishlistProductsIds,
        required this.cartProductsIds,
        required this.onAddToCartTap});

  final List<ProductDM> products;
  final List<String> wishlistProductsIds;
  final List<String> cartProductsIds;
  final Function(String) onUpdateWishlist;
  final Function(String) onAddToCartTap;

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

          /// card
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
                cartProductsId: widget.cartProductsIds,
                product: widget.products[index],
                onUpdateWishlist: widget.onUpdateWishlist,
                wishlistProductsIds: widget.wishlistProductsIds,
                onAddToCartTap: widget.onAddToCartTap,
                productCardLocation: ProductCardLocation.home,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
