import 'category_dm.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.results,
    required this.categoryData,
    this.message,
    this.statusMsg,
  });

  final int? results;
  final List<CategoryDM>? categoryData;
  final String? statusMsg;
  final String? message;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
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



