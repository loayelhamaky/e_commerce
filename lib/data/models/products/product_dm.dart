import 'package:e_commerce_app/data/models/categories/categories_details/sub_category_dm.dart';
import '../categories/categories_details/category_dm.dart';

class ProductDM {
  ProductDM({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.subCategoryDm,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.datumId,
    this.priceAfterDiscount,
    required this.availableColors,
  });

  final double sold;
  final List<String> images;
  final double ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final double quantity;
  final List<Subcategory> subCategoryDm;
  final double price;
  final String imageCover;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String datumId;
  final double? priceAfterDiscount;
  final List<dynamic> availableColors;

  factory ProductDM.fromJson(Map<String, dynamic> json) => ProductDM(
    sold: (json["sold"] ?? 0).toDouble(),
    images: json["images"] != null
        ? List<String>.from(json["images"].map((x) => x))
        : [],
    ratingsQuantity: (json["ratingsQuantity"] ?? 0).toDouble(),
    id: json["_id"] ?? '',
    title: json["title"] ?? '',
    slug: json["slug"] ?? '',
    description: json["description"] ?? '',
    quantity: (json["quantity"] ?? 0).toDouble(),
    subCategoryDm: json['subcategory'] != null
        ? List<Subcategory>.from(
        json['subcategory'].map((x) => Subcategory.fromJson(x))) // Edited to handle subcategory
        : [],
    price: (json["price"] ?? 0).toDouble(),
    imageCover: json["imageCover"] ?? '',
    ratingsAverage: (json["ratingsAverage"] ?? 0.0).toDouble(),
    createdAt:
    DateTime.parse(json["createdAt"] ?? DateTime.now().toString()),
    updatedAt:
    DateTime.parse(json["updatedAt"] ?? DateTime.now().toString()),
    datumId: json["id"] ?? '',
    priceAfterDiscount: json["priceAfterDiscount"] != null
        ? (json["priceAfterDiscount"]).toDouble()
        : null,
    availableColors: json["availableColors"] != null
        ? List<dynamic>.from(json["availableColors"].map((x) => x))
        : [],
  );
}
