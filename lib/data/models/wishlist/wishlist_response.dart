import 'package:e_commerce_app/data/models/products/product_dm.dart';

class WishListResponse {
  WishListResponse(
      {required this.status,
      required this.wishListProducts,
      required this.message,
      required this.statusMsg});
  final String? statusMsg;
  final String? message;
  final String? status;
  final List<ProductDM> wishListProducts;

  factory WishListResponse.fromJson(Map<String, dynamic> json) {
    return WishListResponse(
      status: json["status"],
      wishListProducts: json["data"] == null
          ? []
          : List<ProductDM>.from(
              json["data"]!.map((x) => ProductDM.fromJson(x))),
      message: json ['message'],
      statusMsg: json['statusMsg'],
    );
  }
}
