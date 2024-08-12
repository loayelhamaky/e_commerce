import 'dart:convert';

import 'package:e_commerce_app/data/models/products/product_dm.dart';

class ProductResponse {
  ProductResponse({
    required this.results,
    required this.productData,
    required this.statusMsg,
    required this.message
  });

  final int results;
  final List<ProductDM> productData;
  final String statusMsg;
  final String message;

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json["results"] ?? 0,
      productData: json["data"] != null
          ? List<ProductDM>.from(json["data"].map((x) => ProductDM.fromJson(x)))
          : [],
      statusMsg: json["statusMsg"] ?? '',
      message: json["message"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "results": results,
    "data": List<dynamic>.from(productData.map((x) => x.toJson())),
    "statusMsg": statusMsg,
    "message": message,
  };
}
