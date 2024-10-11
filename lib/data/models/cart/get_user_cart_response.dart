import 'cart_dm.dart';

class GetUserCartResponse {
  GetUserCartResponse({
    required this.status,
    this.message,
    required this.numOfCartItems,
    required this.cartDm,
  });

  final String? status;
  final String? message;
  final int? numOfCartItems;
  final CartDM? cartDm;

  factory GetUserCartResponse.fromJson(Map<String, dynamic> json){
    return GetUserCartResponse(
      status: json["status"],
      message: json['message'] ?? '',
      numOfCartItems: json["numOfCartItems"] ?? '',
      cartDm: json["data"] == null ? null : CartDM.fromJson(json["data"]),
    );
  }
}
