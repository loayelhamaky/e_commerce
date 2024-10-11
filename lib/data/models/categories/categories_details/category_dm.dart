import 'package:e_commerce_app/core/utils/constants/app_assets.dart';

class CategoryDM {
  CategoryDM({
    required this.id,
    required this.name,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;

  factory CategoryDM.fromJson(Map json) {


    return CategoryDM(
      id: json["_id"],
      name: json["name"],
      image: json['image'] ==
              "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"
          ? "https://plus.unsplash.com/premium_photo-1724071103169-ac5646bffa83?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          : json["image"],
    );
  }
}
