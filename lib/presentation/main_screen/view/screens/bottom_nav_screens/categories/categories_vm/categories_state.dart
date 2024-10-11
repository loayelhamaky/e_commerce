// import '../../../../../../../core/enums/app_enums.dart';
// import '../../../../../../../data/models/categories/categories_details/category_dm.dart';
// import '../../../../../../../data/models/categories/categories_details/sub_category_dm.dart';
// import '../../../../../../../data/models/products/product_dm.dart';
//
// class CategoriesState {
//   // List of main categories
//   List<String> categoriesNames = [];
//
//   // List of category IDs
//   List<String> categoriesIds = [];
//
//   // Map to hold subcategories associated with each category
//   Map<String, List<String>> subCategoriesMap = {};
//
//   // List of subcategories
//   List<Subcategory> subcategories = [];
//
//   // List of products associated with a selected subcategory
//   List<ProductDM> subcategoryProducts = [];
//
//   // List of CategoryDM
//   List<CategoryDM> categories = [];
//
//   // Name of the selected category
//   String selectedCategoryName;
//
//   // Image of the selected category
//   String selectedCategoryImage;
//
//   // List of selected index subcategories
//   List<String> selectedIndexSubcategories;
//
//   // API state for loading, success, failure, etc.
//   BaseApiState apiState = BaseApiState.online;
//
//   CategoriesState({
//     this.categoriesNames = const [],
//     this.categoriesIds = const [],
//     this.subCategoriesMap = const {},
//     this.subcategories = const [],
//     this.subcategoryProducts = const [],
//     this.categories = const [],
//     BaseApiState? apiState,
//   })  : selectedCategoryName = (categories.isNotEmpty) ? (categories[0].name ?? '') : '',
//         selectedCategoryImage = (categories.isNotEmpty) ? (categories[0].image ?? '') : '',
//         selectedIndexSubcategories = (categories.isNotEmpty && subCategoriesMap.containsKey(categories[0].id))
//             ? subCategoriesMap[categories[0].id] ?? []
//             : [],
//         apiState = apiState ?? BaseApiState.online;
//
//   // CopyWith method for state management
//   CategoriesState copyWith({
//     List<String>? categoriesNames,
//     List<String>? categoriesIds,
//     Map<String, List<String>>? subCategoriesMap,
//     List<Subcategory>? subcategories,
//     List<ProductDM>? subcategoryProducts,
//     List<CategoryDM>? categories,
//     String? selectedCategoryName,
//     String? selectedCategoryImage,
//     List<String>? selectedIndexSubcategories,
//     BaseApiState? apiState,
//   }) {
//     return CategoriesState(
//       categoriesNames: categoriesNames ?? this.categoriesNames,
//       categoriesIds: categoriesIds ?? this.categoriesIds,
//       subCategoriesMap: subCategoriesMap ?? this.subCategoriesMap,
//       subcategories: subcategories ?? this.subcategories,
//       subcategoryProducts: subcategoryProducts ?? this.subcategoryProducts,
//       categories: categories ?? this.categories,
//       apiState: apiState ?? this.apiState,
//     )
//       ..selectedCategoryName = selectedCategoryName ??
//           ((categories?.isNotEmpty ?? false) ? categories![0].name ?? '' : '')
//       ..selectedCategoryImage = selectedCategoryImage ??
//           ((categories?.isNotEmpty ?? false) ? categories![0].image ?? '' : '')
//       ..selectedIndexSubcategories = selectedIndexSubcategories ??
//           ((categories != null &&
//               categories.isNotEmpty &&
//               subCategoriesMap != null &&
//               subCategoriesMap.containsKey(categories[0].id))
//               ? subCategoriesMap[categories[0].id] ?? []
//               : []);
//   }
// }
import '../../../../../../../core/enums/app_enums.dart';
import '../../../../../../../data/models/categories/categories_details/category_dm.dart';
import '../../../../../../../data/models/categories/categories_details/sub_category_dm.dart';
import '../../../../../../../data/models/products/product_dm.dart';

class CategoriesState {
  // List of main categories
  List<String> categoriesNames = [];

  // List of category IDs
  List<String> categoriesIds = [];

  // Map to hold subcategories associated with each category
  Map<String, List<String>> subCategoriesMap = {};

  // List of subcategories
  List<Subcategory> subcategories = [];

  // List of products associated with a selected subcategory
  List<ProductDM> subcategoryProducts = [];

  // List of CategoryDM
  List<CategoryDM> categories = [];

  // Name of the selected category
  String selectedCategoryName;

  // Image of the selected category
  String selectedCategoryImage;

  // List of selected index subcategories
  List<String> selectedIndexSubcategories;

  // API state for loading, success, failure, etc.
  BaseApiState apiState = BaseApiState.online;

  // Map to hold subcategory names and their associated images
  Map<String, String> subCategoryImages = {};

  CategoriesState({
    this.categoriesNames = const [],
    this.categoriesIds = const [],
    this.subCategoriesMap = const {},
    this.subcategories = const [],
    this.subcategoryProducts = const [],
    this.categories = const [],
    this.subCategoryImages = const {},
    BaseApiState? apiState,
  })  : selectedCategoryName = (categories.isNotEmpty) ? (categories[0].name ?? '') : '',
        selectedCategoryImage = (categories.isNotEmpty) ? (categories[0].image ?? '') : '',
        selectedIndexSubcategories = (categories.isNotEmpty && subCategoriesMap.containsKey(categories[0].id))
            ? subCategoriesMap[categories[0].id] ?? []
            : [],
        apiState = apiState ?? BaseApiState.online;

  // CopyWith method for state management
  CategoriesState copyWith({
    List<String>? categoriesNames,
    List<String>? categoriesIds,
    Map<String, List<String>>? subCategoriesMap,
    List<Subcategory>? subcategories,
    List<ProductDM>? subcategoryProducts,
    List<CategoryDM>? categories,
    String? selectedCategoryName,
    String? selectedCategoryImage,
    List<String>? selectedIndexSubcategories,
    Map<String, String>? subCategoryImages,
    BaseApiState? apiState,
  }) {
    return CategoriesState(
      categoriesNames: categoriesNames ?? this.categoriesNames,
      categoriesIds: categoriesIds ?? this.categoriesIds,
      subCategoriesMap: subCategoriesMap ?? this.subCategoriesMap,
      subcategories: subcategories ?? this.subcategories,
      subcategoryProducts: subcategoryProducts ?? this.subcategoryProducts,
      categories: categories ?? this.categories,
      subCategoryImages: subCategoryImages ?? this.subCategoryImages,
      apiState: apiState ?? this.apiState,
    )
      ..selectedCategoryName = selectedCategoryName ??
          ((categories?.isNotEmpty ?? false) ? categories![0].name ?? '' : '')
      ..selectedCategoryImage = selectedCategoryImage ??
          ((categories?.isNotEmpty ?? false) ? categories![0].image ?? '' : '')
      ..selectedIndexSubcategories = selectedIndexSubcategories ??
          ((categories != null &&
              categories.isNotEmpty &&
              subCategoriesMap != null &&
              subCategoriesMap.containsKey(categories[0].id))
              ? subCategoriesMap[categories[0].id] ?? []
              : []);
  }
}
