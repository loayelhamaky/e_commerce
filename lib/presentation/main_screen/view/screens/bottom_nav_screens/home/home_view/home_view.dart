import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/data/shared_prefs_utils/shared_prefs_utils.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/home/vm/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../auth_screens/login/view.dart';
import '../../../../main_ui_component/header_search_bar.dart';
import '../home_ui_content/home_categories_view/home_categories_view.dart';
import '../vm/home_vm.dart';
import '../../../../../../../di/di.dart';
import '../../../../../../../core/utils/constants/app_strings.dart';
import '../home_ui_content/home_appliance/home_appliance_view.dart';
import '../../../../../../../core/utils/constants/app_assets.dart';
import '../home_ui_content/image_carousel_slider/image_carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeVm homeVm = getIt();

  @override
  void initState() {
    super.initState();
    homeVm.getCategoriesAndProducts();
    homeVm.listenToStreams();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: const HeaderSearchBar()),
          // const ImageCarouselSlider(
          //   adImages: [
          //     AppAssets.adImage,
          //     AppAssets.adImage2,
          //     AppAssets.adImage3,
          //   ],
          // ),
          BlocListener<HomeVm, HomeState>(
            bloc: homeVm,
            listener: (context, state) {
              if (state.updateWishlistState == BaseApiState.loading ||
                  state.updateCartState == BaseApiState.loading) {
                DialogUtils.showLoading(context);
              } else {
                DialogUtils.hidePopContext(context);
              }
            },
            child: BlocBuilder<HomeVm, HomeState>(
              bloc: homeVm,
              builder: (context, state) {
                if (state.categoriesTitlesAndImages.isNotEmpty &&
                    state.products.isNotEmpty) {
                  return Column(
                    children: [
                      HomeCategoriesView(
                        homeCategoriesNameAndImage:
                            state.categoriesTitlesAndImages,
                      ),
                      HomeAppliance(
                        cartProductsIds: state.cartProductIds,
                        products: state.products,
                        onUpdateWishlist: homeVm.onWishlistTap,
                        wishlistProductsIds: state.wishListProductIds,
                        onAddToCartTap: homeVm.onCartTap,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(AppStrings.productsLoadingError),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
