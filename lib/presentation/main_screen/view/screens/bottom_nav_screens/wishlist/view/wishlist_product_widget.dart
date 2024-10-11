import 'package:e_commerce_app/core/utils/app_common_widgets/cart_and_wishlist_product/cart_wishlist_product_view.dart';
import 'package:e_commerce_app/data/models/products/product_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../core/utils/constants/app_text_styles.dart';

class WishlistProductWidget extends StatelessWidget {
  const WishlistProductWidget(
      {super.key,
      required this.product,
      required this.cartProductsIds,
      required this.onRemoveFromWishlist,
      required this.onAddOrRemoveFromCart});
  final ProductDM product;
  final List<String> cartProductsIds;
  final Function(String) onRemoveFromWishlist;
  final Function(String) onAddOrRemoveFromCart;

  @override
  Widget build(BuildContext context) {
    return CartAndWishListProduct(
        product: product,
        topRightIcon: IconButton(
            style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                iconSize: WidgetStatePropertyAll(26.sp),
                iconColor: const WidgetStatePropertyAll(AppColors.primary)),
            onPressed: () => onRemoveFromWishlist(product.id),
            icon: Container(
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 4,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 4)
                ]),
                child: const Icon(
                    IconlyBold.heart)) // Icon changes based on wishlist status
            ),
        bottomRightButton: TextButton(
            onPressed: () => onAddOrRemoveFromCart(product.id),
            child: Text(
              cartProductsIds.contains(product.id)
                  ? 'remove from cart'
                  : 'Add to cart',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium.copyWith(color: Colors.white),
            )));
  }
}
