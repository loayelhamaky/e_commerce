import 'package:e_commerce_app/data/models/cart/remove_update_quantity_response.dart';

import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class CartState {
  CartState({
    List<ProductDM>? mainProducts,
    this.baseApiState = BaseApiState.loading,
    this.isCartEmpty = false,
    this.totalPrice = 0,
    List<ProductDM>? cartProducts,
    List<String>? cartProductsIds,
    List<int>? cartProductsCount,
    Map<String, int>? productsIdAndCount,
    this.errorMsg,
  })  : mainProducts = mainProducts ?? [],
        cartProducts = cartProducts ?? [],
        cartProductsIds = cartProductsIds ?? [],
        productsIdAndCount = productsIdAndCount ?? {};

  final List<ProductDM> mainProducts;
  final List<ProductDM> cartProducts;
  final List<String> cartProductsIds;
  final Map<String, int> productsIdAndCount;
  final bool isCartEmpty;
  final int totalPrice;
  final BaseApiState baseApiState;
  final String? errorMsg;

  CartState copyWith({
    List<ProductDM>? mainProducts,
    List<ProductDM>? cartProducts,
    List<String>? cartProductsIds,
    Map<String, int>? cartProductsIdAndCount,
    BaseApiState? baseApiState,
    bool? isCartEmpty,
    int? totalPrice,
    String? errorMsg,
  }) {
    return CartState(
      mainProducts: mainProducts ?? this.mainProducts,
      cartProducts: cartProducts ?? this.cartProducts,
      cartProductsIds: cartProductsIds ?? this.cartProductsIds,
      productsIdAndCount: cartProductsIdAndCount ?? this.productsIdAndCount,
      isCartEmpty: isCartEmpty ?? this.isCartEmpty,
      baseApiState: baseApiState ?? this.baseApiState,
      totalPrice: totalPrice ?? this.totalPrice,
      errorMsg: errorMsg ?? this.errorMsg
    );
  }
}
