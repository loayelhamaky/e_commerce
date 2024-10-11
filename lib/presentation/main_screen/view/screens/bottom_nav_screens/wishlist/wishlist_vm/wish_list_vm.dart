import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';
import '../../../../../../../domain/interface_repos/wishlist_repo.dart';
import '../../../../../../../domain/interface_repos/cart_repo.dart';
import '../../../../../main_vm/main_vm.dart';
import 'wish_list_state.dart';

@injectable
class WishListVm extends Cubit<WishListState> {
  final WishListRepo wishListRepo;
  final CartRepo cartRepo;
  final MainVm mainVm;

  WishListVm(this.wishListRepo, this.mainVm, this.cartRepo)
      : super(WishListState());

  void initialize() {
    emit(state.copyWith(mainProducts: mainVm.state.products));
    _getInitialWishlist();
    _listenToWishlistIdsChanges();
    _listenToCartIdsChanges();
  }

  Future<void> _getInitialWishlist() async {
    emit(state.copyWith(baseApiState: BaseApiState.loading));
    final result = await wishListRepo.getUserWishList();
    result.fold(
      (error) => emit(
          state.copyWith(baseApiState: BaseApiState.failure, errorMsg: error)),
      (wishlist) {
        emit(state.copyWith(
            isWishlistEmpty: wishlist.wishListProducts.isEmpty,
            baseApiState: BaseApiState.success));
      },
    );
  }

  void _listenToWishlistIdsChanges() {
    wishListRepo.getWishlistIdsStream().listen(
      (wishlistIds) {
        List<ProductDM> products = [];
        for (var product in state.allProducts) {
          if (wishlistIds.contains(product.id)) {
            products.add(product);
          }
        }
        emit(state.copyWith(
          wishlistProducts: products,
          isWishlistEmpty: products.isEmpty,
        ));
      },
    );
  }

  void _listenToCartIdsChanges() {
    cartRepo.getCartIdsStream().listen(
      (cartIds) {
        emit(state.copyWith(cartProductsIds: cartIds));
      },
    );
    emit(state.copyWith(baseApiState: BaseApiState.success));
  }

  Future<void> onHeartButtonTap(String productId) async {
    try {
      emit(state.copyWith(baseApiState: BaseApiState.loading));
      await wishListRepo.removeFromWishList(productId);
      emit(state.copyWith(baseApiState: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(baseApiState: BaseApiState.failure));
    }
  }

  Future<void> onAddToCartTap(String productId) async {
    emit(state.copyWith(baseApiState: BaseApiState.loading));
    try {
      if (state.cartProductsIds.contains(productId)) {
        await cartRepo.removeCartProduct(productId);
        state.cartProductsIds.remove(productId);
      } else {
        await cartRepo.addCartProduct(productId);
        state.cartProductsIds.add(productId);
      }
      emit(state.copyWith(baseApiState: BaseApiState.success));
    } catch (e) {
      emit(state.copyWith(baseApiState: BaseApiState.failure));
      print(e.toString());
    }
  }
}
