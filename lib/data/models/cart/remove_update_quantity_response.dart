import 'cart_productDetails.dart';

/// response to remove/update quantity for cart products
class RemoveOrUpdateQuantityResponse {
  RemoveOrUpdateQuantityResponse({
    required this.status,
    this.message,
    required this.numOfCartItems,
    required this.data,
  });

  final String? status;
  final dynamic message; // Changed from String? to dynamic to handle different types
  final int? numOfCartItems;
  final RemoveUpdateData? data;

  factory RemoveOrUpdateQuantityResponse.fromJson(Map<String, dynamic> json) {
    return RemoveOrUpdateQuantityResponse(
      status: json["status"],
      message: json["message"], // Handle as dynamic here, and cast appropriately where needed
      numOfCartItems: json["numOfCartItems"],
      data: json["data"] == null ? null : RemoveUpdateData.fromJson(json["data"]),
    );
  }
}

class RemoveUpdateData {
  RemoveUpdateData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  final String? id;
  final String? cartOwner;
  final List<CartProductDetails> products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  factory RemoveUpdateData.fromJson(Map<String, dynamic> json){
    return RemoveUpdateData(
      id: json["_id"],
      cartOwner: json["cartOwner"],
      products: json["products"] == null ? [] : List<CartProductDetails>.from(json["products"]!.map((x) => CartProductDetails.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      totalCartPrice: json["totalCartPrice"],
    );
  }
}
