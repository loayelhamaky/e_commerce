import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/core/utils/app_common_widgets/cart_and_wishlist_product/cart_wishlist_product_view.dart';
import 'package:e_commerce_app/core/utils/constants/app_assets.dart';
import 'package:e_commerce_app/core/utils/constants/app_colors.dart';
import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:e_commerce_app/core/utils/constants/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/core/utils/error/error_strings.dart';
import 'package:e_commerce_app/presentation/main_screen/view/main_screen_view.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/view/widgets/cart_product_widget.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/view/widgets/checkout_widget.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/vm/cart_state.dart';
import 'package:e_commerce_app/presentation/main_screen/view/screens/bottom_nav_screens/cart/vm/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../../di/di.dart';
import 'package:lottie/lottie.dart';

import '../../../../main_ui_component/header_search_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const String routeName = 'cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartVm cartVm = getIt();

  @override
  void initState() {
    super.initState();
    cartVm.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const HeaderSearchBar(),
          BlocListener<CartVm, CartState>(
            bloc: cartVm,
            listener: (context, state) {
              if (state.baseApiState == BaseApiState.loading) {
                DialogUtils.showLoading(context);
              } else {
                DialogUtils.hidePopContext(context);
              }
            },
            child: BlocBuilder<CartVm, CartState>(
              bloc: cartVm,
              builder: (context, state) {
                if (state.baseApiState == BaseApiState.failure) {
                  return const Center(
                    child: Text(ErrorStrings.errorDefaultMessage),
                  );
                } else if (state.isCartEmpty == true &&
                    state.baseApiState == BaseApiState.success) {
                  return AppCommonWidgets.emptyListWidget(context,
                      AppStrings.cart, AppAssets.emptyCartAnimation);
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.cartProducts.length,
                            itemBuilder: (context, index) => CartProductWidget(
                              product: state.cartProducts[index],
                              onDelete: cartVm.onRemoveFromCartTap,
                              onChangeQuantity: cartVm.onChangeQuantity,
                              count: state.productsIdAndCount[
                                      state.cartProducts[index].id] ??
                                  0,
                            ),
                          ),
                        ),
                        CheckoutWidget(
                            totalPrice: state.totalPrice,
                            onCheckOut: cartVm.onCheckOut)
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
