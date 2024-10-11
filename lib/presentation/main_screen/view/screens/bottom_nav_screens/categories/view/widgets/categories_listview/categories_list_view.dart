import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../data/models/categories/categories_details/category_dm.dart';
import 'widgets/category_name_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView(
      {super.key,
      required this.onCategoryTap,
      required this.selectedCategoryName,
      required this.categories});
  final Function(String) onCategoryTap;
  final List<CategoryDM> categories;
  final String selectedCategoryName;
  @override
  Widget build(BuildContext context) {
    final List<String> names = categories.map((category) => category.name!).toList();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r)),
          border: const Border(
            left: BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onCategoryTap(categories[index].id!);
              },
              child: CategoryNameWidget(
                  name: names[index],
                  isSelected: names[index] ==
                      selectedCategoryName),
            );
          },
        ),
      ),
    );
  }
}
