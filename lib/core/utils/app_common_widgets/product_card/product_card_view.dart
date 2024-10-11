import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../data/models/products/product_dm.dart';
import '../../../../presentation/main_screen/view/screens/product_details/arguments/product_arguments.dart';
import '../../../../presentation/main_screen/view/screens/product_details/view/product_details_view.dart';
import 'card_widgets/card_widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductDM product;
  final Function(String) onUpdateWishlist;
  final Function(String) onAddToCartTap;
  final List<String> wishlistProductsIds;
  final List<String> cartProductsId;
  final ProductCardLocation productCardLocation;

  const ProductCard({
    Key? key,
    required this.product,
    required this.wishlistProductsIds,
    required this.onUpdateWishlist,
    required this.onAddToCartTap,
    required this.cartProductsId,
    required this.productCardLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 1.6.w,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            ProductDetailsView.routeName,
            arguments: ProductCardArguments(
              id: product.id,
              price: product.priceAfterDiscount ?? product.price,
              images: product.images,
              title: product.title,
              ratingsAverage: product.ratingsAverage,
              imageUrl: product.imageCover,
              description: product.description,
              sold: product.sold,
              availableColors: product.availableColors,
              ratingQuantity: product.ratingsQuantity,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImageAndIcon(
                image: product.imageCover,
                productId: product.id,
                onUpdateWishlist: onUpdateWishlist,
                wishlistProductsId: wishlistProductsIds,
              ),
              CardTitleAndDescription(
                text: product.title,
                productCardLocation: productCardLocation,
              ),
              CardTitleAndDescription(
                text: product.description,
                productCardLocation: productCardLocation,
              ),
              CardPrice(
                  price: product.priceAfterDiscount ?? product.price,
                  originalPrice:
                      product.priceAfterDiscount == null ? 0 : product.price,
              productCardLocation: productCardLocation),
              CardReviewStarAdd(
                rating: product.ratingsAverage,
                id: product.id,
                onUpdateCart: onAddToCartTap,
                cartProductsId: cartProductsId,
                productCardLocation: productCardLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
