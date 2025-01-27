import 'package:jp_challenge/gen/assets.gen.dart';

enum ProductCategory {
  sweet,
  salty,
  drinks,
}

class Product {
  Product({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.image,
    required this.ratings,
    required this.category,
  });

  final String title;
  final String subtitle;
  final String description;
  final String price;
  final AssetGenImage image;
  final String ratings;
  final ProductCategory category;
}
