import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce_app/core/utils/constants/app_assets.dart';
import 'package:e_commerce_app/core/enums/app_enums.dart';
import 'package:e_commerce_app/data/models/categories/categories_details/sub_category_dm.dart';
import 'package:e_commerce_app/data/models/products/product_dm.dart';
import '../../../../../../../domain/interface_repos/main_repo.dart';
import '../../../../../../../domain/interface_repos/cart_repo.dart';
import '../../../../../../../domain/interface_repos/wishlist_repo.dart';
import '../../../../../main_vm/main_vm.dart';
import '../../../subcategories_products_screen/arguments/arguments.dart';
import '../../../subcategories_products_screen/view/view.dart';
import 'categories_state.dart';

@injectable
class CategoriesVm extends Cubit<CategoriesState> {
  MainVm mainVm;
  MainRepo mainRepo;
  WishListRepo wishListRepo;
  CartRepo cartRepo;

  CategoriesVm(this.cartRepo, this.wishListRepo, this.mainVm, this.mainRepo)
      : super(CategoriesState());

  // Map to store subcategory names and their respective image paths
  Map<String, String> subCategoryImages = {};

  void getSubCategories() async {
    emit(state.copyWith(apiState: BaseApiState.loading));
    try {
      List<ProductDM> mainProducts = mainVm.state.products;
      Map<String, List<String>> categoriesIdsAndSubCategories = {};
      List<Subcategory> subCategories = [];
      List<String> categoriesIds = [];

      for (var product in mainProducts) {
        var productSubCategory = product.subCategoryDm[0];
        if (!categoriesIds.contains(productSubCategory.categoryId)) {
          categoriesIds.add(productSubCategory.categoryId);
          categoriesIdsAndSubCategories
              .addAll({productSubCategory.categoryId: []});
        }
        Subcategory subCategory = productSubCategory;
        if (!subCategories.any((item) =>
            item.id == subCategory.id &&
            !categoriesIdsAndSubCategories.containsValue(subCategory.id))) {
          subCategories.add(subCategory);
          categoriesIdsAndSubCategories[subCategory.categoryId]
              ?.add(subCategory.name);

          // Initialize the map with subcategory names and their images
          subCategoryImages[subCategory.name] =
              _getImageForSubCategory(subCategory.name);
        }
      }

      emit(state.copyWith(
        categoriesNames: mainVm.state.categoriesTitlesAndImages.keys.toList(),
        categories: mainVm.state.categories,
        subCategoriesMap: categoriesIdsAndSubCategories,
        subCategoryImages: subCategoryImages, // Add this to the state
        apiState: BaseApiState.success,
      ));
    } catch (e) {
      emit(state.copyWith(apiState: BaseApiState.failure));
      print(e.toString());
    }
  }

  // Helper method to get the image path for a subcategory
  String _getImageForSubCategory(String subCategoryName) {
    switch (subCategoryName) {
      case 'Networking Products':
        return AppAssets.networkingProducts;
      case 'Printers & Accessories':
        return AppAssets.printersAccessories;
      case 'Cameras & Accessories':
        return AppAssets.camerasAccessories;
      case 'Video Games':
        return AppAssets.videoGames;
      case 'Laptops & Accessories':
        return AppAssets.laptops;
      case 'Men\'s Clothing':
        return AppAssets
            .mensClothing; // Ensure this key matches the exact subcategory name
      case 'Women\'s Clothing':
        return AppAssets
            .womensClothing; // Ensure this key matches the exact subcategory name
      default:
        return AppAssets
            .categoryTest; // Use a fallback image if no match is found
    }
  }

  void onCategoryTab(String categoryId) {
    String name = '';
    String image = '';
    List<String> subCategoriesNames = [];

    for (var category in state.categories) {
      if (category.id == categoryId) {
        name = category.name!;
        image = category.image!;
      }
    }
    if (state.subCategoriesMap.containsKey(categoryId)) {
      subCategoriesNames = state.subCategoriesMap[categoryId]!.toList();
    }

    emit(state.copyWith(
        selectedIndexSubcategories: subCategoriesNames,
        selectedCategoryImage: image,
        selectedCategoryName: name));
  }

  void onSubCategoryTap(BuildContext context, String subCategoryName) {
    final List<ProductDM> filteredProducts = [];

    for(var product in mainVm.state.products){
      var productSubCat = product.subCategoryDm[0].name;
      print(productSubCat);
      print(subCategoryName);
      if(productSubCat == subCategoryName){
        filteredProducts.add(product);
      }
    }
    print(filteredProducts.length);
    print("______________________________");

    Navigator.pushNamed(
      context,
      SubCategoryProductsView.routeName,
      arguments: SubCategoryProductsArguments(
        subCategoryName: subCategoryName,
        products: filteredProducts,
      ),
    );

  }
}
