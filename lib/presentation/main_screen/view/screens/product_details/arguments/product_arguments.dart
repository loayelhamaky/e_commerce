
class ProductCardArguments {
  final String id;
  final double price;
  final List<String> images;
  final String title;
  final double ratingsAverage;
  final String description;
  final double sold;
  final String imageUrl;
  final List<dynamic> availableColors;
  final double ratingQuantity;

  ProductCardArguments({
    required this.id,
    required this.ratingQuantity,
    required this.price,
    required this.images,
    required this.title,
    required this.ratingsAverage,
    required this.imageUrl,
    required this.description,
    required this.sold,
    required this.availableColors,
  });
}
