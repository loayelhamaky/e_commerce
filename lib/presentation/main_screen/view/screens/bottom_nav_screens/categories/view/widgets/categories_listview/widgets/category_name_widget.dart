import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../../core/utils/constants/app_text_styles.dart';

class CategoryNameWidget extends StatelessWidget {
  const CategoryNameWidget(
      {super.key, required this.name, required this.isSelected});
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.08,
      child: isSelected
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Expanded(
                  child: Text(
                    '  $name',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.medium
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          : Container(
              color: AppColors.greyInFigma,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '  $name',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.medium.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),

      /// unselected
    );
  }
}
