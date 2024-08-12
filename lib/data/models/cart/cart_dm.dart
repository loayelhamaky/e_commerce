
import 'cart_productDetails.dart';

class CartDM {
  CartDM({
    required this.id,
    required this.cartOwner,
    required this.cartProducts,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  final String? id;
  final String? cartOwner;
  final List<CartProductDetails> cartProducts;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  factory CartDM.fromJson(Map<String, dynamic> json){
    return CartDM(
      id: json["_id"],
      cartOwner: json["cartOwner"],
      cartProducts: json["products"] == null ? [] : List<CartProductDetails>.from(json["products"]!.map((x) => CartProductDetails.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      totalCartPrice: json["totalCartPrice"],
    );
  }

}