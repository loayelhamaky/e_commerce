import 'package:e_commerce_app/presentation/main_screen/view/screens/subcategories_products_screen/vm/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../domain/interface_repos/cart_repo.dart';
import '../../../../../../../domain/interface_repos/wishlist_repo.dart';

@injectable
class SubCategoryProductsVm extends Cubit<SubCategoryProductsState> {
  final WishListRepo wishListRepo;
  final CartRepo cartRepo;

  SubCategoryProductsVm(this.wishListRepo, this.cartRepo)
      : super(SubCategoryProductsState());

  void initialize(var args) {
    emit(state.copyWith(
      subCategoryName: args.subCategoryName,
      products: args.products,
    ));

    _listenToWishlistIdsChanges();
    _listenToCartIdsChanges();
  }

  Future<void> onWishlistTap(String id) async {
    emit(state.copyWith(updateWishlistState: BaseApiState.loading));
    try {
      if (state.wishListProductIds.contains(id)) {
        await wishListRepo.removeFromWishList(id);
        state.wishListProductIds.remove(id);
      } else {
        await wishListRepo.addProductToWishList(id);
        state.wishListProductIds.add(id);
      }

      emit(state.copyWith(
        updateWishlistState: BaseApiState.success,
      ));
    } catch (e) {
      emit(state.copyWith(updateWishlistState: BaseApiState.failure));
    }
  }

  void _listenToWishlistIdsChanges() {
    wishListRepo.getWishlistIdsStream().listen(
          (wishlistIds) {
        emit(state.copyWith(wishListProductIds: wishlistIds));
      },
    );
  }

  Future<void> onCartTap(String id) async {
    emit(state.copyWith(updateCartState: BaseApiState.loading));
    try {
      if (state.cartProductIds.contains(id)) {
        await cartRepo.removeCartProduct(id);
      } else {
        await cartRepo.addCartProduct(id);
      }

      emit(state.copyWith(
        updateCartState: BaseApiState.success,
      ));
    } catch (e) {
      emit(state.copyWith(updateCartState: BaseApiState.failure));
    }
  }

  void _listenToCartIdsChanges() {
    cartRepo.getCartIdsStream().listen(
          (cartIds) {
        emit(state.copyWith(
          cartProductIds: cartIds,
        ));
      },
    );
  }
}
