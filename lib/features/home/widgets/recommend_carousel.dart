import 'package:flutter/material.dart';
import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/features/home/widgets/carousel_recommend_card.dart';

class RecommendCarousel extends StatelessWidget {
  const RecommendCarousel({
    super.key,
    required this.products,
    required this.onPressed,
  });

  final List<Product> products;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CarouselRecommendCard(
                product: product,
                onPressed: onPressed,
              ),
            );
          },
        ),
      ),
    );
  }
}
