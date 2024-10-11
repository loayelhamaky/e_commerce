import 'dart:convert';

import 'package:e_commerce_app/data/models/products/product_dm.dart';

class ProductResponse {
  ProductResponse({
    required this.results,
    required this.productDmList,
    required this.statusMsg,
    required this.message
  });

  final int results;
  final List<ProductDM> productDmList;
  final String statusMsg;
  final String message;

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json["results"] ?? 0,
      productDmList: json["data"] != null
          ? List<ProductDM>.from(json["data"].map((x) => ProductDM.fromJson(x)))
          : [],
      statusMsg: json["statusMsg"] ?? '',
      message: json["message"] ?? '',
    );
  }
}
