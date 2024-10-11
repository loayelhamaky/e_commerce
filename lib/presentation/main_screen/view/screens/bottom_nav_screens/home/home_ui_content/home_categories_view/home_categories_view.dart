import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../../../core/utils/constants/app_text_styles.dart';
import '../../../../../../../../core/utils/error/error_strings.dart';
import 'widgets/home_categories_widgets.dart';

class HomeCategoriesView extends StatelessWidget {
  final Map<String, String> homeCategoriesNameAndImage;
  const HomeCategoriesView({super.key, required this.homeCategoriesNameAndImage});

  @override
  Widget build(BuildContext context) {
    if (homeCategoriesNameAndImage.isEmpty) {
      return Center(
          child: Text(ErrorStrings.errorDefaultMessage,
              style: AppTextStyles.heading));
    }
    final keys = homeCategoriesNameAndImage.keys.toList();
    return Column(
      children: [
        HomeCategoriesWidgets.homeCategoriesTitle(context),
        SizedBox(
          height: 300.h,
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: GridView.builder(
              itemCount: homeCategoriesNameAndImage.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 100.w,
                crossAxisCount: 2, // Two rows
                mainAxisSpacing: 18.w,
                crossAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) => ElevatedButton(
                  onPressed: () {
                    /////////////////////////////////////////////////////
                  },
                  style: const ButtonStyle(
                    padding:
                        WidgetStatePropertyAll(EdgeInsetsDirectional.all(0)),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    elevation: WidgetStatePropertyAll(0),
                  ),
                  child: HomeCategoriesWidgets.homeCategoryWidget(
                    homeCategoriesNameAndImage[keys[index]]!,
                    keys[index],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
