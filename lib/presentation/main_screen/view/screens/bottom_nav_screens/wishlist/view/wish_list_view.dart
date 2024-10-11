import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/core/utils/constants/app_assets.dart';
import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/wishlist/view/wishlist_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../../core/utils/error/error_strings.dart';
import '../../../../../../../di/di.dart';
import '../../../../main_ui_component/header_search_bar.dart';
import '../wishlist_vm/wish_list_state.dart';
import '../wishlist_vm/wish_list_vm.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});
  static const String routeName = 'wish list';

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  final WishListVm wishListVm = getIt();

  @override
  void initState() {
    super.initState();
    wishListVm.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const HeaderSearchBar(),
            BlocListener<WishListVm, WishListState>(
              bloc: wishListVm,
              listener: (context, state) {
                if (state.baseApiState == BaseApiState.loading) {
                  DialogUtils.showLoading(context);
                } else {
                  DialogUtils.hidePopContext(context);
                }
              },
              child: Expanded(
                child: BlocBuilder<WishListVm, WishListState>(
                  bloc: wishListVm,
                  builder: (context, state) {
                    if (state.baseApiState == BaseApiState.failure) {
                      return const Center(
                        child: Text(ErrorStrings.errorDefaultMessage),
                      );
                    } else if (state.isWishlistEmpty &&
                        state.baseApiState == BaseApiState.success) {
                      return AppCommonWidgets.emptyListWidget(
                          context,
                          AppStrings.wishlist,
                          AppAssets.emptyWishlistAnimation);
                    } else {
                      return ListView.builder(
                          itemCount: state.wishlistProducts.length,
                          itemBuilder: (context, index) =>
                              WishlistProductWidget(
                                  product: state.wishlistProducts[index],
                                  cartProductsIds: state.cartProductsIds,
                                  onRemoveFromWishlist:
                                      wishListVm.onHeartButtonTap,
                                  onAddOrRemoveFromCart:
                                      wishListVm.onAddToCartTap));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
