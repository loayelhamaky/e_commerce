import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class WishListState {
  WishListState({
    List<ProductDM>? mainProducts,
    this.baseApiState = BaseApiState.loading,
    this.productWidgetLocation = ProductWidgetLocation.inWishList,
    this.isWishlistEmpty = false,
    this.errorMsg,
    List<ProductDM>? wishlistProducts,
    List<String>? cartProductsIds,
  }) : allProducts = mainProducts ?? [],
        wishlistProducts = wishlistProducts ?? [],
        cartProductsIds = cartProductsIds ?? [];

  final List<ProductDM> allProducts;
  final List<ProductDM> wishlistProducts;
  final List<String> cartProductsIds;
  final bool isWishlistEmpty;
  final String? errorMsg;
  final ProductWidgetLocation productWidgetLocation;
  final BaseApiState baseApiState;

  WishListState copyWith({
    List<ProductDM>? mainProducts,
    List<ProductDM>? wishlistProducts,
    List<String>? cartProductsIds,
    bool? isWishlistEmpty,
    String? errorMsg,
    ProductWidgetLocation? productWidgetLocation,
    BaseApiState? baseApiState,
  }) {
    return WishListState(
      mainProducts: mainProducts ?? this.allProducts,
      wishlistProducts: wishlistProducts ?? this.wishlistProducts,
      errorMsg: errorMsg ?? this.errorMsg,
      cartProductsIds: cartProductsIds ?? this.cartProductsIds,
      isWishlistEmpty: isWishlistEmpty ?? this.isWishlistEmpty, // Added this boolean
      productWidgetLocation: productWidgetLocation ?? this.productWidgetLocation,
      baseApiState: baseApiState ?? this.baseApiState,
    );
  }
}
