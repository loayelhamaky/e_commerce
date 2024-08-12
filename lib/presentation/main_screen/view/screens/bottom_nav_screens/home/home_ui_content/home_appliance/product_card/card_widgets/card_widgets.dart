
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../../core/utils/dialog_utils.dart';
import '../../../../../../../../../auth_screens/login/view.dart';

///Image Stack
class CardImage extends StatelessWidget {
  final String image;

  const CardImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image.isNotEmpty
            ? Image.network(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    DialogUtils.imageErrorBuilder(
                        context, error, stackTrace, image, 30.h, 30.w),
              )
            : const Icon(Icons.error),
        Positioned(
          top: 8.h,
          right: 6.w,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              child: Icon(
                IconlyLight.heart,
                color: AppColors.primary,
                size: 26.sp, // Set icon size
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///Same Design
class CardTitleDescription extends StatelessWidget {
  final String text;
  const CardTitleDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

///Price Row
class CardPrice extends StatelessWidget {
  final double? price;
  final double? originalPrice;

  const CardPrice({
    Key? key,
    this.price,
    this.originalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Text(
            '$price EGP',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
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
    );
  }
}

///Last Line
class CardReviewStarAdd extends StatelessWidget {
  final double rating;

  const CardReviewStarAdd({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Row(
            children: [
              Text(
                'Review: ($rating)  ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
              Icon(
                IconlyBold.star,
                color: Colors.amber,
                size: 20.sp,
              ),
            ],
          ),
        ),
        Positioned(
          right: 6.w,
          child: Container(
            margin: EdgeInsets.only(right: 4.w),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        ),
      ],
    );
  }
}
