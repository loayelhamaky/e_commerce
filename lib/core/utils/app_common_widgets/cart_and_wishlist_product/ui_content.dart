import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/core/utils/app_common_widgets/app_common_widgets.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

abstract class CartWishListProductUi {
  static productImage(String image, BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            border: Border.all(width: 0.4.w)),
        child: Image.network(
          image,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return DialogUtils.imageErrorBuilder(
                context, error, stackTrace, image, 30.h, 30.w);
          },
        ),
      ),
    );
  }

  static titleAndIcon(
    String productId,
    String title,
    Function(String) onDeleteOrWishlistTap,
    ProductWidgetLocation productWidgetLocation,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.heading.copyWith(fontSize: 18.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
        ),
        IconButton(
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            iconSize: WidgetStatePropertyAll(26.sp),
            iconColor: productWidgetLocation == ProductWidgetLocation.inWishList
                ? const WidgetStatePropertyAll(AppColors.primary)
                : const WidgetStatePropertyAll(Colors.black),
          ),
          onPressed: () => onDeleteOrWishlistTap(productId),
          icon: productWidgetLocation == ProductWidgetLocation.inWishList
              ? Container(
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: AppColors.grey,
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 4)
                  ]),
                  child: const Icon(IconlyBold.heart))
              : const ImageIcon(
                  AssetImage(AppAssets.deleteIcon),
                ), // Icon changes based on wishlist status
        )
      ],
    );
  }

  static priceAndButton(
      String productId,
      double price,
      Function(String, bool? addOrRemove) isAddClicked,
      List<String>? cartProductsIds,
      ProductWidgetLocation productWidgetLocation,
      int numberOfProducts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'EGP $price',
          style: AppTextStyles.medium.copyWith(fontSize: 18.sp),
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
            child: productWidgetLocation == ProductWidgetLocation.inCart
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Visibility(
                        visible: numberOfProducts == 1 ? false : true,
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
                              iconColor:
                                  const WidgetStatePropertyAll(Colors.white),
                              iconSize: WidgetStatePropertyAll(24.sp),
                              elevation: const WidgetStatePropertyAll(0),
                            ),
                            onPressed: () {
                              //numberOfProducts--;
                              isAddClicked(productId, false);
                            },
                            icon: const Icon(Icons.remove_circle_outline)),
                      ),
                      Text('$numberOfProducts',
                          style: AppTextStyles.medium.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500)),
                      IconButton(
                          style: ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            iconColor:
                                const WidgetStatePropertyAll(Colors.white),
                            iconSize: WidgetStatePropertyAll(24.sp),
                            elevation: const WidgetStatePropertyAll(0),
                          ),
                          onPressed: () {
                            isAddClicked(productId, true);
                            //numberOfProducts++;
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  )

                /// if in wishlist
                :
            TextButton(
                    onPressed: () => isAddClicked(productId, null),
                    child: Text(
                      cartProductsIds!.contains(productId)
                          ? 'remove from cart'
                          : 'Add to cart',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.medium.copyWith(color: Colors.white),
                    )))
      ],
    );
  }
}
//import 'package:e_commerce_app/core/enums/app_enums.dart';
// import 'package:e_commerce_app/core/utils/app_common_widgets/app_common_widgets.dart';
// import 'package:e_commerce_app/core/utils/dialog_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconly/iconly.dart';
// import '../../constants/app_assets.dart';
// import '../../constants/app_colors.dart';
// import '../../constants/app_text_styles.dart';
//
// abstract class CartWishListProductUi {
//   static productImage(String image, BuildContext context) {
//     return Expanded(
//       flex: 3,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20.r)),
//             border: Border.all(width: 0.4.w)),
//         child: Image.network(
//           image,
//           fit: BoxFit.contain,
//           errorBuilder: (context, error, stackTrace) {
//             return DialogUtils.imageErrorBuilder(
//                 context, error, stackTrace, image, 30.h, 30.w);
//           },
//         ),
//       ),
//     );
//   }
//
//   static titleAndIcon(
//     String productId,
//     String title,
//     Function(String) onDeleteOrWishlistTap,
//     ProductWidgetLocation productWidgetLocation,
//   ) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             title,
//             style: AppTextStyles.heading.copyWith(fontSize: 18.sp),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             textAlign: TextAlign.start,
//           ),
//         ),
//         IconButton(
//           style: ButtonStyle(
//             visualDensity: VisualDensity.compact,
//             iconSize: WidgetStatePropertyAll(26.sp),
//             iconColor: productWidgetLocation == ProductWidgetLocation.inWishList
//                 ? const WidgetStatePropertyAll(AppColors.primary)
//                 : const WidgetStatePropertyAll(Colors.black),
//           ),
//           onPressed: () => onDeleteOrWishlistTap(productId),
//           icon: productWidgetLocation == ProductWidgetLocation.inWishList
//               ? Container(
//                   decoration:
//                       const BoxDecoration(shape: BoxShape.circle, boxShadow: [
//                     BoxShadow(
//                         color: AppColors.grey,
//                         blurRadius: 4,
//                         blurStyle: BlurStyle.outer,
//                         spreadRadius: 4)
//                   ]),
//                   child: const Icon(IconlyBold.heart))
//               : const ImageIcon(
//                   AssetImage(AppAssets.deleteIcon),
//                 ), // Icon changes based on wishlist status
//         )
//       ],
//     );
//   }
//
//   static priceAndButton(
//       String productId,
//       double price,
//       Function(String, bool? addOrRemove) isAddClicked,
//       List<String>? cartProductsIds,
//       ProductWidgetLocation productWidgetLocation,
//       int numberOfProducts) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'EGP $price',
//           style: AppTextStyles.medium.copyWith(fontSize: 18.sp),
//           overflow: TextOverflow.ellipsis,
//         ),
//         Container(
//             margin: EdgeInsets.only(right: 6.w),
//             decoration: BoxDecoration(
//               color: AppColors.primary,
//               borderRadius: BorderRadius.circular(30.r),
//             ),
//             width: 130.w,
//             height: 45.h,
//             child: productWidgetLocation == ProductWidgetLocation.inCart
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Visibility(
//                         visible: numberOfProducts == 1 ? false : true,
//                         replacement: IconButton(
//                           visualDensity: VisualDensity.compact,
//                           iconSize: 24.sp,
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.remove_circle_outline,
//                             color: Colors.grey,
//                             shadows: [BoxShadow(blurStyle: BlurStyle.inner)],
//                           ),
//                         ),
//                         child: IconButton(
//                             style: ButtonStyle(
//                               visualDensity: VisualDensity.compact,
//                               iconColor:
//                                   const WidgetStatePropertyAll(Colors.white),
//                               iconSize: WidgetStatePropertyAll(24.sp),
//                               elevation: const WidgetStatePropertyAll(0),
//                             ),
//                             onPressed: () {
//                               //numberOfProducts--;
//                               isAddClicked(productId, false);
//                             },
//                             icon: const Icon(Icons.remove_circle_outline)),
//                       ),
//                       Text('$numberOfProducts',
//                           style: AppTextStyles.medium.copyWith(
//                               color: Colors.white,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500)),
//                       IconButton(
//                           style: ButtonStyle(
//                             visualDensity: VisualDensity.compact,
//                             iconColor:
//                                 const WidgetStatePropertyAll(Colors.white),
//                             iconSize: WidgetStatePropertyAll(24.sp),
//                             elevation: const WidgetStatePropertyAll(0),
//                           ),
//                           onPressed: () {
//                             isAddClicked(productId, true);
//                             //numberOfProducts++;
//                           },
//                           icon: const Icon(Icons.add_circle_outline)),
//                     ],
//                   )
//
//                 /// if in wishlist
//                 : TextButton(
//                     onPressed: () => isAddClicked(productId, null),
//                     child: Text(
//                       cartProductsIds!.contains(productId)
//                           ? 'remove from cart'
//                           : 'Add to cart',
//                       overflow: TextOverflow.ellipsis,
//                       style: AppTextStyles.medium.copyWith(color: Colors.white),
//                     )))
//       ],
//     );
//   }
// }