class CategoryDM {
  CategoryDM({
    required this.id,
    required this.name,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;

  factory CategoryDM.fromJson(Map<String, dynamic> json) {
    return CategoryDM(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
    );
  }
}