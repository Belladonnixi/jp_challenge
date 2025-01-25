import 'package:jp_challenge/gen/assets.gen.dart';

class Product {
  Product({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.image,
    required this.ratings,
  });

  final String title;
  final String subtitle;
  final String description;
  final String price;
  final AssetGenImage image;
  final String ratings;
}
