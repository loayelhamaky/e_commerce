import 'cart_productDetails.dart';

class CartDM {
  CartDM({
    required this.cartId,
    required this.cartOwner,
    required this.cartProductsDetails,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  final String? cartId;
  final String? cartOwner;
  final List<CartProductDetails> cartProductsDetails;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  factory CartDM.fromJson(Map<String, dynamic> json) {
    return CartDM(
      cartId: json["_id"],
      cartOwner: json["cartOwner"],
      cartProductsDetails: json["products"] == null
          ? []
          : List<CartProductDetails>.from(
          json["products"]!.map((x) => CartProductDetails.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      totalCartPrice: json["totalCartPrice"],
    );
  }
}
