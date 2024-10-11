import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class SubCategoryProductsState {
  final String subCategoryName;
  final List<ProductDM> products;
  final List<String> wishListProductIds;
  final List<String> cartProductIds;
  final BaseApiState updateWishlistState;
  final BaseApiState updateCartState;

  SubCategoryProductsState({
    this.subCategoryName = '',
    this.products = const [],
    this.wishListProductIds = const [],
    this.cartProductIds = const [],
    this.updateWishlistState = BaseApiState.success,
    this.updateCartState = BaseApiState.success,
  });

  SubCategoryProductsState copyWith({
    String? subCategoryName,
    List<ProductDM>? products,
    List<String>? wishListProductIds,
    List<String>? cartProductIds,
    BaseApiState? updateWishlistState,
    BaseApiState? updateCartState,
  }) {
    return SubCategoryProductsState(
      subCategoryName: subCategoryName ?? this.subCategoryName,
      products: products ?? this.products,
      wishListProductIds: wishListProductIds ?? this.wishListProductIds,
      cartProductIds: cartProductIds ?? this.cartProductIds,
      updateWishlistState: updateWishlistState ?? this.updateWishlistState,
      updateCartState: updateCartState ?? this.updateCartState,
    );
  }
}
