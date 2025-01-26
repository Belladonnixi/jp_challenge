import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/data/product_repo.dart';
import 'package:jp_challenge/features/home/widgets/product_card.dart';
import 'package:jp_challenge/features/home/widgets/recommend_carousel.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Assets.backgrounds.bgMainscreen.image(
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 235,
            left: 24,
            right: 24,
            child: ProductCard(
              title: 'Angi\'s Yummy Burger',
              description: 'Delish vegan burger\nthat tastes like heaven',
              price: '13.99',
              rating: '4.8',
              image: Assets.images.burger.image(
                fit: BoxFit.contain,
              ),
              onAddToOrder: () {},
            ),
          ),
          const Positioned(
            top: 530,
            left: 24,
            child: Text(
              'We Recommend',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: SnackishColors.solidCreamWhite,
                letterSpacing: -0.5,
              ),
            ),
          ),
          Positioned(
            top: 570,
            bottom: 32,
            child: RecommendCarousel(
              products: products,
            ),
          ),
        ],
      ),
    );
  }
}
