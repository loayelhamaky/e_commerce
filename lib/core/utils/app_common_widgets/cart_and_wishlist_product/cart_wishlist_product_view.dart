import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/core/utils/app_common_widgets/cart_and_wishlist_product/ui_content.dart';
import 'package:e_commerce_app/data/models/cart/cart_productDetails.dart';
import 'package:e_commerce_app/data/models/products/product_dm.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/arguments/product_arguments.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CartAndWishListProduct extends StatelessWidget {
  const CartAndWishListProduct({
    super.key,
    required this.product,
    required this.topRightIcon,
    required this.bottomRightButton,
  });

  final ProductDM product;
  final IconButton topRightIcon;
  final Widget bottomRightButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailsView.routeName,
              arguments: ProductCardArguments(
                  id: product.id,
                  ratingQuantity: product.ratingsQuantity,
                  price: product.price,
                  images: product.images,
                  title: product.title,
                  ratingsAverage: product.ratingsAverage,
                  imageUrl: product.imageCover,
                  description: product.description,
                  sold: product.sold,
                  availableColors: product.availableColors));
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                border: Border.all(width: 1.h)),
            child: Row(children: [
              /// Image
              CartWishListProductUi.productImage(product.imageCover, context),

              /// Product Details
              Expanded(
                  flex: 7,
                  child: Container(
                      margin: EdgeInsets.only(left: 8.w, bottom: 8.w, top: 4.w),
                      child: Column(children: [
                        /// Title and (delete or remove from wishlist)
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.title,
                                style: AppTextStyles.heading
                                    .copyWith(fontSize: 18.sp),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            topRightIcon
                          ],
                        ),
                        // CartWishListProductUi.titleAndIcon(
                        //   product.id,
                        //   product.title,
                        //   onDeleteOrHeartTap,
                        //   productWidgetLocation,
                        // ),
                        const Spacer(),

                        /// Price and Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EGP ${product.price}',
                              style: AppTextStyles.medium
                                  .copyWith(fontSize: 18.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 6.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                width: 130.w,
                                height: 45.h,
                                child: bottomRightButton
                                // CartWishListProductUi.priceAndButton(
                                //   product.id,
                                //   product.priceAfterDiscount ?? product.price,
                                //   onAddOrRemove,
                                //   cartProductsIds,
                                //   productWidgetLocation,
                                //   cartProductCount ?? 1,
                                // )
                                ),
                          ],
                        ),
                      ])))
            ])));
  }
}
//import 'package:e_commerce_app/core/enums/app_enums.dart';
// import 'package:e_commerce_app/core/utils/app_common_widgets/cart_and_wishlist_product/ui_content.dart';
// import 'package:e_commerce_app/data/models/cart/cart_productDetails.dart';
// import 'package:e_commerce_app/data/models/products/product_dm.dart';
// import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/arguments/product_arguments.dart';
// import 'package:e_commerce_app/presentation/main_screen/view/screens/product_details/view/product_details_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CartAndWishListProduct extends StatelessWidget {
//   const CartAndWishListProduct({
//     super.key,
//     required this.product,
//     required this.onDeleteOrHeartTap,
//     required this.onAddOrRemove,
//     this.cartProductsIds,
//     this.cartProductCount,
//     required this.productWidgetLocation,
//   });
//
//   final ProductDM product;
//   final int? cartProductCount;
//   final Function(String) onDeleteOrHeartTap;
//   final Function(String, bool? isAddClicked) onAddOrRemove;
//   final List<String>? cartProductsIds;
//   final ProductWidgetLocation productWidgetLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, ProductDetailsView.routeName,
//             arguments: ProductCardArguments(
//                 id: product.id,
//                 ratingQuantity: product.ratingsQuantity,
//                 price: product.price,
//                 images: product.images,
//                 title: product.title,
//                 ratingsAverage: product.ratingsAverage,
//                 imageUrl: product.imageCover,
//                 description: product.description,
//                 sold: product.sold,
//                 availableColors: product.availableColors));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 16.h),
//         height: 120.h,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20.r)),
//             border: Border.all(width: 1.h)),
//         child: Row(
//           children: [
//             /// Image
//             CartWishListProductUi.productImage(product.imageCover, context),
//
//             /// Product Details
//             Expanded(
//               flex: 7,
//               child: Container(
//                 margin: EdgeInsets.only(left: 8.w, bottom: 8.w, top: 4.w),
//                 child: Column(
//                   children: [
//                     /// Title and (delete or remove from wishlist)
//                     CartWishListProductUi.titleAndIcon(
//                       product.id,
//                       product.title,
//                       onDeleteOrHeartTap,
//                       productWidgetLocation,
//                     ),
//                     const Spacer(),
//
//                     /// Price and Button
//                     CartWishListProductUi.priceAndButton(
//                       product.id,
//                       product.priceAfterDiscount ?? product.price,
//                       onAddOrRemove,
//                       cartProductsIds,
//                       productWidgetLocation,
//                       cartProductCount ?? 1,
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
