

import '../products/product_dm.dart';

class CartProductDetails {
  CartProductDetails({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  final int? count;
  final String? id;
  final ProductDM? product;
  final int? price;

  factory CartProductDetails.fromJson(Map<String, dynamic> json){
    return CartProductDetails(
      count: json["count"],
      id: json["_id"],
      product: json["product"] == null ? null : ProductDM.fromJson(json["product"]),
      price: json["price"],
    );
  }

}