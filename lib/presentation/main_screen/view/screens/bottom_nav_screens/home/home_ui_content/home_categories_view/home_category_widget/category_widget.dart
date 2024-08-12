import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/utils/constants/app_text_styles.dart';
import '../../../../../../../../../core/utils/dialog_utils.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String categoryTitle;

  const CategoryWidget({
    Key? key,
    required this.image,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: DialogUtils.imageErrorBuilder(
                            context, error, stackTrace, image, 90.h, 90.h),
                      )),
                ),
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          height: 40.h,
          child: Text(
            categoryTitle,
            style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w500,fontSize: 16.sp),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
