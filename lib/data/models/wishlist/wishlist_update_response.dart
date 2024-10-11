class WishlistUpdateResponse {
  WishlistUpdateResponse({
    required this.status,
    required this.message,
    required this.wishListProductIds,
    required this.statusMsg,
  });

  final String? status;
  final String? message;
  final List<String> wishListProductIds;
  final String statusMsg;

  factory WishlistUpdateResponse.fromJson(Map<String, dynamic> json){
    return WishlistUpdateResponse(
      status: json["status"],
      statusMsg: json["statusMsg"] ?? '',
      message: json["message"] ?? '',
      wishListProductIds: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    );
  }
}
