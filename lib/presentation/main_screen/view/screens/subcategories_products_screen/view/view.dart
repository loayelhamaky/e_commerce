import 'package:flutter/material.dart';
import '../../../../../../core/enums/app_enums.dart';
import '../../../../../../core/utils/app_common_widgets/product_card/product_card_view.dart';
import '../../../../../../di/di.dart';
import '../arguments/arguments.dart';
import '../vm/vm.dart';
import '../../../../../../core/utils/app_common_widgets/app_common_widgets.dart';
import '../../../../../../core/utils/constants/app_text_styles.dart';

class SubCategoryProductsView extends StatelessWidget {
  static const String routeName = 'sub-category-products-view';

  const SubCategoryProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SubCategoryProductsArguments;

    final SubCategoryProductsVm subCategoryProductsVm = getIt();
    subCategoryProductsVm.initialize(args);

    return Scaffold(
      appBar: AppCommonWidgets.productDetailsAndCartAppBar(
          args.subCategoryName, context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: args.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 2 / 2.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: args.products[index],
                  wishlistProductsIds:
                  subCategoryProductsVm.state.wishListProductIds,
                  cartProductsId: subCategoryProductsVm.state.cartProductIds,
                  onUpdateWishlist: subCategoryProductsVm.onWishlistTap,
                  onAddToCartTap: subCategoryProductsVm.onCartTap,
                  productCardLocation: ProductCardLocation.categories,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
