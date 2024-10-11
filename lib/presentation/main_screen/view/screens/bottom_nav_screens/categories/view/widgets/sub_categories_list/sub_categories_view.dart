import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/view/widgets/sub_categories_list/widgets/empty_subcategory_widget.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/view/widgets/sub_categories_list/widgets/subcategories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../core/utils/constants/app_text_styles.dart';
import 'widgets/category_top_image.dart';

class SubCategoriesView extends StatelessWidget {
  final String selectedCategoryName;
  final String selectedCategoryImage;
  final List<String> selectedIndexSubcategories;
  final Map<String, String> subCategoryImages;
  final Function(BuildContext,String) onSubCategoryTap;

  const SubCategoriesView({
    Key? key,
    required this.selectedCategoryName,
    required this.selectedCategoryImage,
    required this.selectedIndexSubcategories,
    required this.subCategoryImages,
    required this.onSubCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Category Name Text
        Padding(
          padding: EdgeInsets.only(bottom: 14.h, left: 10.w),
          child: Text(
            selectedCategoryName,
            style: AppTextStyles.heading.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        /// Image Stack
        CategoryTopImage(
          name: selectedCategoryName,
          image: selectedCategoryImage,
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: selectedIndexSubcategories.isNotEmpty
              ? SubCategoriesList(
                  subCategoryNames: selectedIndexSubcategories,
                  subCategoryImages: subCategoryImages,
                  onSubCategoryTap : onSubCategoryTap,
                )
              : EmptySubCategoriesWidget(
                  selectedCategoryName: selectedCategoryName),
        ),
      ],
    );
  }
}
