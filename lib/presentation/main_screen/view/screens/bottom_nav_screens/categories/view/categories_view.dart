import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/categories_vm/categories_state.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/categories_vm/categories_vm.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/view/widgets/categories_listview/categories_list_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/categories/view/widgets/sub_categories_list/sub_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../di/di.dart';
import '../../../../main_ui_component/header_search_bar.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/core/enums/app_enums.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});
  static const String routeName = 'categories';

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final CategoriesVm categoriesVm = getIt();

  @override
  void initState() {
    super.initState();
    categoriesVm.getSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const HeaderSearchBar(),
          BlocListener<CategoriesVm, CategoriesState>(
            bloc: categoriesVm,
            listener: (context, state) {
              if (state.apiState == BaseApiState.loading) {
                DialogUtils.showLoading(context);
              } else {
                DialogUtils.hidePopContext(context);
              }
            },
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015,
                ),
                child: Row(
                  children: [
                    /// left
                    Expanded(
                      flex: 55,
                      child: BlocBuilder<CategoriesVm, CategoriesState>(
                        bloc: categoriesVm,
                        builder: (context, state) {
                          return CategoriesListView(
                            categories: state.categories,
                            onCategoryTap: categoriesVm.onCategoryTab,
                            selectedCategoryName: state.selectedCategoryName,
                          );
                        },
                      ),
                    ),

                    /// right
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 100,
                      child: BlocBuilder<CategoriesVm, CategoriesState>(
                        bloc: categoriesVm,
                        builder: (context, state) {
                          return SubCategoriesView(
                            selectedCategoryName: state.selectedCategoryName,
                            selectedCategoryImage: state.selectedCategoryImage,
                            selectedIndexSubcategories:
                                state.selectedIndexSubcategories,
                            subCategoryImages: state.subCategoryImages,
                            onSubCategoryTap: categoriesVm.onSubCategoryTap,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
