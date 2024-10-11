import 'package:e_commerce_app/data/models/cart/cart_productDetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';
import '../../../../../../../domain/interface_repos/cart_repo.dart';
import '../../../../../main_vm/main_vm.dart';
import 'cart_state.dart';

@injectable
class CartVm extends Cubit<CartState> {
  final CartRepo cartRepo;
  final MainVm mainVm;

  CartVm(this.cartRepo, this.mainVm) : super(CartState());

  void initialize() {
    try {
      emit(state.copyWith(baseApiState: BaseApiState.loading));
      emit(state.copyWith(mainProducts: mainVm.state.products));
      _getInitialCart();
      _listenToTotalPriceChanges();
      _listenToCartIdsChanges();
      emit(state.copyWith(baseApiState: BaseApiState.success));
    } catch (e) {
      print(e.toString());
    }
  }

  /// bool to check if cart is empty or not
  Future<void> _getInitialCart() async {
    final result = await cartRepo.getUserCart();
    result.fold(
      (error) => emit(
          state.copyWith(baseApiState: BaseApiState.failure, errorMsg: error)),
      (cartDM) {
        List<CartProductDetails> products = cartDM.cartProductsDetails;
        Map<String, int> idsCount = {};
        for (var product in products) {
          idsCount.addAll({product.product!.id: product.count!});
        }
        emit(state.copyWith(
            cartProductsIdAndCount: idsCount,
            cartProductsIds: products
                .map(
                  (cartProductDetails) => cartProductDetails.product!.id,
                )
                .toList(),
            isCartEmpty: cartDM.cartProductsDetails.isEmpty));
      },
    );
  }

  Future<void> onRemoveFromCartTap(String productId) async {
    emit(state.copyWith(baseApiState: BaseApiState.loading));
    final result = await cartRepo.removeCartProduct(productId);
    result.fold(
      (error) => emit(
          state.copyWith(baseApiState: BaseApiState.failure, errorMsg: error)),
      (success) => emit(state.copyWith(baseApiState: BaseApiState.success)),
    );
  }

  void onChangeQuantity(String id, bool isAddClicked) async {
    try {
      Map<String, int> theIdsAndCount = state.productsIdAndCount;
      emit(state.copyWith(baseApiState: BaseApiState.loading));

      if (isAddClicked) {
        int count = theIdsAndCount[id]!;
        count++;
        theIdsAndCount[id] = count;
        await cartRepo.updateProductQuantity(id, count);
      } else if (state.productsIdAndCount[id]! > 1 && !isAddClicked) {
        int count = theIdsAndCount[id]!;
        count--;
        theIdsAndCount[id] = count;
        await cartRepo.updateProductQuantity(id, count);
      }

      emit(state.copyWith(baseApiState: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(baseApiState: BaseApiState.failure));
    }
  }

  void _listenToCartIdsChanges() {
    cartRepo.getCartIdsStream().listen((cartIds) {
      List<ProductDM> updatedCartProducts = [];
      Map<String, int> idsAndCount = {};

      // Update the products in the cart based on the new cartIds
      for (var product in state.mainProducts) {
        if (cartIds.contains(product.id)) {
          updatedCartProducts.add(product);
          idsAndCount[product.id] = state.productsIdAndCount[product.id] ?? 1;
        }
      }

      emit(state.copyWith(
        baseApiState: BaseApiState.success,
        isCartEmpty: cartIds.isEmpty,
        cartProducts: updatedCartProducts,
        cartProductsIdAndCount: idsAndCount,
        cartProductsIds: cartIds,
      ));
    });
  }

  void _listenToTotalPriceChanges() {
    cartRepo.getTotalPriceStream().listen((newPrice) {
      emit(state.copyWith(totalPrice: newPrice));
    });
  }

  onCheckOut() {
    emit(state.copyWith(baseApiState: BaseApiState.loading));
    emit(state.copyWith(baseApiState: BaseApiState.success));
  }
}
