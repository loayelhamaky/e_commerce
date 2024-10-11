import '../categories_details/category_dm.dart';

class HomeCategoriesResponse {
  HomeCategoriesResponse({
    required this.results,
    required this.categoryData,
    this.message,
    this.statusMsg,
  });

  final int? results;
  final List<CategoryDM>? categoryData;
  final String? statusMsg;
  final String? message;

  factory HomeCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return HomeCategoriesResponse(
      message: json['message'] ?? 'null',
      statusMsg: json['statusMsg'] ?? 'null',
      results: json["results"],
      categoryData: json["data"] == null
          ? []
          : List<CategoryDM>.from(
          json["data"]!.map((x) => CategoryDM.fromJson(x))),
    );
  }
}



