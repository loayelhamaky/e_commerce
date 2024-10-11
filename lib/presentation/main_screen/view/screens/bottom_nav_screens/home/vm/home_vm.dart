import 'package:e_commerce_app/presentation/main_screen/main_vm/main_vm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../domain/interface_repos/cart_repo.dart';
import '../../../../../../../domain/interface_repos/wishlist_repo.dart';
import 'home_state.dart';

@injectable
class HomeVm extends Cubit<HomeState> {
  /// mainVm to get products and categories already loaded instead of loading
  /// from repo to improve performance
  final MainVm mainVm;
  final WishListRepo wishlistRepo;
  final CartRepo cartRepo;

  HomeVm(this.wishlistRepo, this.cartRepo, this.mainVm) : super(HomeState());
  void getCategoriesAndProducts() {
    state.categoriesTitlesAndImages = mainVm.state.categoriesTitlesAndImages;
    state.products = mainVm.state.products;
  }

  void listenToStreams() {
    _listenToWishlistIdsChanges();
    _listenToCartIdsChanges();
  }

  /// wishlist
  Future<void> onWishlistTap(String id) async {
    emit(state.copyWith(updateWishlistState: BaseApiState.loading));
    try {
      if (state.wishListProductIds.contains(id)) {
        await wishlistRepo.removeFromWishList(id);
        state.wishListProductIds.remove(id);
      } else {
        await wishlistRepo.addProductToWishList(id);
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
    wishlistRepo.getWishlistIdsStream().listen(
      (wishlistIds) {
        emit(state.copyWith(wishListProductIds: wishlistIds));
      },
    );
  }

  /// cart
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
