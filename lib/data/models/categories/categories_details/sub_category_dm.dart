import 'package:e_commerce_app/data/models/categories/categories_details/category_dm.dart';

import '../../products/product_dm.dart';

class Subcategory {
  final String id;
  final String name;
  final String categoryId;

  Subcategory({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      categoryId: json['category']?? '',
    );
  }
}