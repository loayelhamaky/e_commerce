import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../../../core/utils/constants/app_text_styles.dart';
import 'home_category_widget/category_widget.dart';

class HomeCategoriesView extends StatelessWidget {
  final Map<String, String> titlesAndImages;
  HomeCategoriesView({super.key, required this.titlesAndImages});

  //final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (titlesAndImages.isEmpty) {
      return Center(child: Text(AppStrings.errorDefaultMessage, style: AppTextStyles.heading));
    }
    final keys = titlesAndImages.keys.toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.categories, style: AppTextStyles.heading),
              TextButton(
                onPressed: () {
/////////////////////////////////////////////////////
                },
                child: Text(
                  AppStrings.viewAll,
                  style: AppTextStyles.medium.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300.h, // Adjust the height as needed
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: GridView.builder(
              itemCount: titlesAndImages.length,
              //controller: _controller,
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
                  padding: WidgetStatePropertyAll(EdgeInsetsDirectional.all(0)),
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  elevation: WidgetStatePropertyAll(0),
                ),
                child: CategoryWidget(
                  image: titlesAndImages[keys[index]]! ,
                  categoryTitle: keys[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
