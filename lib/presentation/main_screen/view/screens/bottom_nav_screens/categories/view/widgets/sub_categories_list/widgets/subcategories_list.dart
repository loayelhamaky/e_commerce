import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/utils/constants/app_assets.dart';
import 'package:e_commerce_app/core/utils/constants/app_text_styles.dart';

class SubCategoriesList extends StatelessWidget {
  final List<String> subCategoryNames;
  final Map<String, String> subCategoryImages;
  final Function(BuildContext,String) onSubCategoryTap;

  const SubCategoriesList({
    Key? key,
    required this.subCategoryNames,
    required this.subCategoryImages,
    required this.onSubCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: subCategoryNames.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onSubCategoryTap(context ,subCategoryNames[index]);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.085,
                  width: MediaQuery.of(context).size.height * 0.085,
                  child: Image.asset(
                    subCategoryImages[subCategoryNames[index]] ??
                        AppAssets.categoryTest,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  subCategoryNames[index],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
