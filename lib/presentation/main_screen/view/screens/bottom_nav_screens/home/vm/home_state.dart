
import '../../../../../../../core/enums/base_api_state.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class HomeState {
  Map<String, String> categoriesTitlesAndImages = {};
  int categoriesLength = 0;
  int productsLength = 0;
  List<ProductDM> products = [];
  BaseApiState categoriesState = BaseApiState.loading;
  BaseApiState productState = BaseApiState.loading;

  HomeState({
    Map<String, String>? categoriesTitlesAndImages,
    List<ProductDM>? products,
    this.categoriesLength = 0,
    this.productsLength = 0,
    this.categoriesState = BaseApiState.loading,
    this.productState = BaseApiState.loading
  })  : categoriesTitlesAndImages = categoriesTitlesAndImages ?? {},
        products = products ?? [];

  HomeState copyWith({
    Map<String, String>? categoriesTitlesAndImages,
    int? categoriesLength,
    int? productsLength,
    List<ProductDM>? products,
    BaseApiState? categoriesState,
    BaseApiState? productState,
  }) {
    return HomeState(
      categoriesTitlesAndImages:
          categoriesTitlesAndImages ?? this.categoriesTitlesAndImages,
      categoriesLength: categoriesLength ?? this.categoriesLength,
      productsLength: productsLength ?? this.productsLength,
      products: products ?? this.products,
      categoriesState: categoriesState ?? this.categoriesState,
      productState: productState ?? this.productState,
    );
  }
}
