import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class HomeState {
  /// categories
  Map<String, String> categoriesTitlesAndImages = {};

  /// home appliance
  List<ProductDM> products = [];

  /// wishlist
  List<String> wishListProductIds = [];
  BaseApiState updateWishlistState = BaseApiState.success;

  /// cart
  List<String> cartProductIds = [];
  BaseApiState updateCartState = BaseApiState.success;

  HomeState({
    List<ProductDM>? products,
    List<String>? wishListProductIds,
    List<String>? cartProductIds,
    Map<String, String>? categoriesTitlesAndImages,
    this.updateWishlistState = BaseApiState.success,
    this.updateCartState = BaseApiState.success,
  })  : wishListProductIds = wishListProductIds ?? [],
        cartProductIds = cartProductIds ?? [],
        categoriesTitlesAndImages = categoriesTitlesAndImages ?? {},
        products = products ?? [];

  HomeState copyWith({
    List<ProductDM>? products,
    Map<String, String>? categoriesTitlesAndImages,
    List<String>? wishListProductIds,
    List<String>? cartProductIds,
    BaseApiState? updateWishlistState,
    BaseApiState? updateCartState,
  }) {
    return HomeState(
      products: products ?? this.products,
      categoriesTitlesAndImages:
          categoriesTitlesAndImages ?? this.categoriesTitlesAndImages,
      wishListProductIds: wishListProductIds ?? this.wishListProductIds,
      cartProductIds: cartProductIds ?? this.cartProductIds,
      updateWishlistState: updateWishlistState ?? this.updateWishlistState,
      updateCartState: updateCartState ?? this.updateCartState,
    );
  }
}
