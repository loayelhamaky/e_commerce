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
  final ProductDM? product;  // Changed from List<ProductDM>? to ProductDM?
  final int? price;

  factory CartProductDetails.fromJson(Map<String, dynamic> json) {
    return CartProductDetails(
      count: json["count"],
      id: json["_id"],
      product: json["product"] == null ? null : ProductDM.fromJson(json["product"]),  // Changed field name from 'products' to 'product'
      price: json["price"],
    );
  }
}
