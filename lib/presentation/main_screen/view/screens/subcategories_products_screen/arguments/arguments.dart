import '../../../../../../data/models/products/product_dm.dart';

class SubCategoryProductsArguments {
  final String subCategoryName;
  final List<ProductDM> products;

  SubCategoryProductsArguments({
    required this.subCategoryName,
    required this.products,
  });
}
