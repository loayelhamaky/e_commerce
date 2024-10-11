import 'package:e_commerce_app/core/utils/constants/app_strings.dart';
import 'package:e_commerce_app/core/utils/error/error_strings.dart';
import 'package:flutter/material.dart';
import '../view/screens/bottom_nav_screens/categories/view/categories_view.dart';
import '../view/screens/bottom_nav_screens/home/home_view/home_view.dart';
import '../view/screens/bottom_nav_screens/profile/view/profile_view.dart';
import '../view/screens/bottom_nav_screens/wishlist/view/wish_list_view.dart';
import '../view/screens/bottom_nav_screens/cart/view/cart_view.dart';
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/products/product_dm.dart';
import '../../../../../../../data/models/categories/categories_details/category_dm.dart';

class MainState {
  static const List<Widget> defaultTabs = [
    HomeView(),
    CategoriesView(),
    WishListView(),
    CartView(),
    ProfileView()
  ];

  final List<Widget> myTabs;
  final int currentSelectedTab;
  String? errorMessage;
  /// categories
  Map<String, String> categoriesTitlesAndImages = {};
  int categoriesLength = 0;
  BaseApiState categoriesState = BaseApiState.loading;
  List<CategoryDM> categories = [];

  /// products
  int productsLength = 0;
  List<ProductDM> products = [];
  BaseApiState productState = BaseApiState.loading;

  MainState({
    this.currentSelectedTab = 0,
    this.myTabs = defaultTabs,
    Map<String, String>? categoriesTitlesAndImages,
    List<ProductDM>? products,
    List<CategoryDM>? categories,
    this.categoriesLength = 0,
    this.productsLength = 0,
    this.errorMessage,
    this.categoriesState = BaseApiState.loading,
    this.productState = BaseApiState.loading,
  })  : categoriesTitlesAndImages = categoriesTitlesAndImages ?? {},
        products = products ?? [],
        categories = categories ?? [];

  MainState copyWith({
    int? currentSelectedTab,
    List<Widget>? myTabs,
    Map<String, String>? categoriesTitlesAndImages,
    int? categoriesLength,
    int? productsLength,
    List<ProductDM>? products,
    List<CategoryDM>? categories,
    BaseApiState? categoriesState,
    BaseApiState? productState,
    String? errorMessage
  }) {
    return MainState(
      currentSelectedTab: currentSelectedTab ?? this.currentSelectedTab,
      myTabs: myTabs ?? this.myTabs,
      categoriesTitlesAndImages:
      categoriesTitlesAndImages ?? this.categoriesTitlesAndImages,
      categoriesLength: categoriesLength ?? this.categoriesLength,
      productsLength: productsLength ?? this.productsLength,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      productState: productState ?? this.productState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
