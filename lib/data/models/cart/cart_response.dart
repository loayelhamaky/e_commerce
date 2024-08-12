import 'cart_dm.dart';

class CartResponse {
  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartData,
  });

  final String? status;
  final int? numOfCartItems;
  final CartDM? cartData;

  factory CartResponse.fromJson(Map<String, dynamic> json){
    return CartResponse(
      status: json["status"],
      numOfCartItems: json["numOfCartItems"],
      cartData: json["data"] == null ? null : CartDM.fromJson(json["data"]),
    );
  }

}




