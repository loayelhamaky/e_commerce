import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../../core/utils/dialog_utils.dart';

///Image Stack
class CardImageAndIcon extends StatefulWidget {
  final String image;
  final String productId;
  final List<String> wishlistProductsId;
  final Function(String) onUpdateWishlist;

  const CardImageAndIcon(
      {Key? key,
      required this.image,
      required this.onUpdateWishlist,
      required this.wishlistProductsId,
      required this.productId})
      : super(key: key);

  @override
  State<CardImageAndIcon> createState() => _CardImageAndIconState();
}

class _CardImageAndIconState extends State<CardImageAndIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.image,
          fit: BoxFit.cover,
          height: 120.h,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) =>
              DialogUtils.imageErrorBuilder(
                  context, error, stackTrace, widget.image, 30.h, 30.w),
        ),
        Positioned(
          top: 8.h,
          right: 6.w,
          child: Container(
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
              color: widget.wishlistProductsId.contains(widget.productId)
                  ? AppColors.primary
                  : Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 6,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                widget.onUpdateWishlist(widget.productId);
              },
              child: Icon(
                IconlyLight.heart,
                color: widget.wishlistProductsId.contains(widget.productId)
                    ? Colors.white
                    : AppColors.primary,
                size: 26.sp, // Set icon size
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///title and description
class CardTitleAndDescription extends StatelessWidget {
  final String text;
  final ProductCardLocation productCardLocation;
  const CardTitleAndDescription(
      {Key? key, required this.text, required this.productCardLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize:
              productCardLocation == ProductCardLocation.home ? 18.sp : 17.sp,
          fontWeight: FontWeight.w700),
    );
  }
}

///Price Row
class CardPrice extends StatelessWidget {
  final double? price;
  final double? originalPrice;
  final ProductCardLocation productCardLocation;

  const CardPrice({
    Key? key,
    this.price,
    this.originalPrice,
    required this.productCardLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Text(
            '$price EGP',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16.sp, fontWeight: productCardLocation == ProductCardLocation.home?  FontWeight.w600: FontWeight.w500),
          ),
          SizedBox(width: 6.w),
          Flexible(
            flex: 1,
            child: Text(
              originalPrice != 0 ? originalPrice!.toStringAsFixed(2) : '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.lightBlue,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightBlue,
                    fontSize: 14.sp,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

///Last Line
class CardReviewStarAdd extends StatelessWidget {
  final double rating;
  final String id;
  final Function(String) onUpdateCart;
  final List<String> cartProductsId;
  final ProductCardLocation productCardLocation;

  const CardReviewStarAdd({
    Key? key,
    required this.rating,
    required this.onUpdateCart,
    required this.cartProductsId,
    required this.id,
    required this.productCardLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Row(
            children: [
              productCardLocation == ProductCardLocation.home
                  ? Text(
                      'Review: ($rating)  ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 18.sp),
                    )
                  : Text(
                      'Review: ($rating) ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16.sp),
                    ),
              productCardLocation == ProductCardLocation.home
                  ? Icon(
                      IconlyBold.star,
                      color: Colors.amber,
                      size: 20.sp,
                    )
                  : Icon(
                      IconlyBold.star,
                      color: Colors.amber,
                      size: 18.sp,
                    ),
              const Spacer(),
              IconButton(
                  visualDensity: VisualDensity.compact,
                  constraints: const BoxConstraints(),
                  style: ButtonStyle(
                    // iconSize: WidgetStatePropertyAll(
                    //     productCardLocation == ProductCardLocation.home? 24.sp : 20.sp
                    // ),
                    shape: WidgetStatePropertyAll(CircleBorder()),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  ),
                  icon: Icon(
                      cartProductsId.contains(id) ? Icons.remove : Icons.add),
                  onPressed: () {
                    onUpdateCart(id);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
