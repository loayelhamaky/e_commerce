class AddToCartResponse {
  AddToCartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddData? data;

  factory AddToCartResponse.fromJson(Map<String, dynamic> json){
    return AddToCartResponse(
      status: json["status"],
      message: json["message"],
      numOfCartItems: json["numOfCartItems"],
      cartId: json["cartId"],
      data: json["data"] == null ? null : AddData.fromJson(json["data"]),
    );
  }

}

class AddData {
  AddData({
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
  final List<AddToCartProduct> products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalCartPrice;

  factory AddData.fromJson(Map<String, dynamic> json){
    return AddData(
      id: json["_id"],
      cartOwner: json["cartOwner"],
      products: json["products"] == null ? [] : List<AddToCartProduct>.from(json["products"]!.map((x) => AddToCartProduct.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      totalCartPrice: json["totalCartPrice"],
    );
  }

}

class AddToCartProduct {
  AddToCartProduct({
    required this.count,
    required this.unUsedId,
    required this.productId,
    required this.price,
  });

  final int? count;
  final String? unUsedId;
  final String? productId;
  final int? price;

  factory AddToCartProduct.fromJson(Map<String, dynamic> json){
    return AddToCartProduct(
      count: json["count"],
      unUsedId: json["_id"],
      productId: json["product"],
      price: json["price"],
    );
  }

}
