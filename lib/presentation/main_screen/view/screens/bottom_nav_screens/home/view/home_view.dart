import '../../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../../core/utils/constants/app_assets.dart';
import '../../../../../../../core/utils/constants/app_strings.dart';
import '../../../../../../../di/di.dart';
import '../../../../main_ui_component/header_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/enums/base_api_state.dart';
import '../home_ui_content/home_appliance/home_appliance_view.dart';
import '../home_ui_content/home_categories_view/home_categories_view.dart';
import '../home_ui_content/image_carousel_slider/image_carousel_slider.dart';
import '../vm/home_state.dart';
import '../vm/home_vm.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeVm vm = getIt();

  @override
  void initState() {
    super.initState();
    vm.loadCategories();
    vm.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSearchBar(),
            /// no api for ads so used some ad images
            const ImageCarouselSlider(
              ads: [
                AppAssets.adImage,
                AppAssets.adImage2,
                AppAssets.adImage3,
              ],
            ),
            BlocBuilder<HomeVm, HomeState>(
              bloc: vm,
              builder: (context, state) {
                if (state.categoriesState == BaseApiState.loading) {
                  return AppCommonWidgets.homeLoadingWidget(context);
                } else if (state.categoriesState == BaseApiState.success) {
                  return HomeCategoriesView(
                    titlesAndImages: state.categoriesTitlesAndImages,
                  );
                } else {
                  return const Center(
                    child: Text(AppStrings.categoriesLoadingError),
                  );
                }
              },
            ),
            BlocBuilder<HomeVm, HomeState>(
                bloc: vm,
                builder: (context, state) {
                  if (state.productState == BaseApiState.success) {
                    return HomeAppliance(
                      products: state.products,
                    );
                  } else if (state.productState == BaseApiState.loading) {
                    return const SizedBox.shrink();
                  }
                  return const Center(
                    child: Text(AppStrings.productsLoadingError),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
