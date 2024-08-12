import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/enums/base_api_state.dart';
import '../../../../../../../data/models/categories/categories_response.dart';
import '../../../../../../../data/models/products/product_response.dart';
import '../../../../../../../domain/repos/main_repo/main_repo.dart';
import 'home_state.dart';

@injectable
class HomeVm extends Cubit<HomeState> {
  MainRepo mainRepo;

  HomeVm(this.mainRepo) : super(HomeState());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesState: BaseApiState.loading));
    try {
      CategoriesResponse categoriesResponse = await mainRepo.getCategories();
      state.categoriesLength = categoriesResponse.results!;

      for (var category in categoriesResponse.categoryData!) {
        final name = category.name;
        final imageUrl = category.image;

        if (name != null &&
            imageUrl != null &&
            Uri.tryParse(imageUrl)?.hasAbsolutePath == true) {
          state.categoriesTitlesAndImages[name] = imageUrl;
        }
      }
      emit(state.copyWith(
          categoriesState: BaseApiState.success,
          categoriesTitlesAndImages: state.categoriesTitlesAndImages));
    } catch (exception) {
      emit(state.copyWith(categoriesState: BaseApiState.failure));
    }
  }

  Future<void> loadProducts() async {
    emit(state.copyWith(productState: BaseApiState.loading));
    try {
      ProductResponse response = await mainRepo.getProducts();
      state.categoriesLength = response.results;
      for (var product in response.productData) {
        state.products.add(product);
      }
      emit(state.copyWith(
          productState: BaseApiState.success, products: state.products));
    } catch (exception) {
      emit(state.copyWith(productState: BaseApiState.failure));
    }
  }
}
