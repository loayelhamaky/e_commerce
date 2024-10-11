import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../../core/utils/constants/app_text_styles.dart';

class CategoryTopImage extends StatelessWidget {
  const CategoryTopImage({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          margin: EdgeInsets.only(left: 10.w, top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grey.withOpacity(0.2),
                            blurStyle: BlurStyle.inner,
                            spreadRadius: 4)
                      ]),
                  child: Text(
                    name,
                    style: AppTextStyles.heading
                        .copyWith(color: AppColors.appText, fontSize: 24.sp,),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                    visualDensity: VisualDensity.compact),
                child: Text(
                  'shop now',
                  style: AppTextStyles.medium.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
