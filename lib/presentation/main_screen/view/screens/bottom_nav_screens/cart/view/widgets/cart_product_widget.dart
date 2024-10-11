import 'package:e_commerce_app/core/utils/app_common_widgets/cart_and_wishlist_product/cart_wishlist_product_view.dart';
import 'package:e_commerce_app/data/models/products/product_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/utils/constants/app_assets.dart';
import '../../../../../../../../core/utils/constants/app_text_styles.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget(
      {super.key,
      required this.product,
      required this.onDelete,
      required this.onChangeQuantity,
      required this.count});
  final ProductDM product;
  final Function(String) onDelete;
  final Function(String, bool) onChangeQuantity;
  final int count;

  @override
  Widget build(BuildContext context) {
    return CartAndWishListProduct(
        product: product,
        topRightIcon: IconButton(
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            iconSize: WidgetStatePropertyAll(26.sp),
            iconColor: const WidgetStatePropertyAll(Colors.black),
          ),
          onPressed: () => onDelete(product.id),
          icon: const ImageIcon(
            AssetImage(AppAssets.deleteIcon),
          ),
        ),
        bottomRightButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: count == 1 ? false : true,
              replacement: IconButton(
                visualDensity: VisualDensity.compact,
                iconSize: 24.sp,
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.grey,
                  shadows: [BoxShadow(blurStyle: BlurStyle.inner)],
                ),
              ),
              child: IconButton(
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    iconColor: const WidgetStatePropertyAll(Colors.white),
                    iconSize: WidgetStatePropertyAll(24.sp),
                    elevation: const WidgetStatePropertyAll(0),
                  ),
                  onPressed: () {
                    onChangeQuantity(product.id, false);
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
            ),
            Text('$count',
                style: AppTextStyles.medium.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500)),
            IconButton(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  iconColor: const WidgetStatePropertyAll(Colors.white),
                  iconSize: WidgetStatePropertyAll(24.sp),
                  elevation: const WidgetStatePropertyAll(0),
                ),
                onPressed: () {
                  onChangeQuantity(product.id, true);
                  //numberOfProducts++;
                },
                icon: const Icon(Icons.add_circle_outline)),
          ],
        ));
  }
}
