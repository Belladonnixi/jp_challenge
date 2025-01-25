import 'package:flutter/material.dart';
import 'package:jp_challenge/features/home/widgets/product_card.dart';
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
            left: 16,
            right: 16,
            child: ProductCard(
              title: "Angi's Yummy Burger",
              description: "Delish vegan burger\nthat tastes like heaven",
              price: "13.99",
              rating: "4.8",
              image: Assets.images.burger.image(
                fit: BoxFit.contain,
              ),
              onAddToOrder: () {
                // Funktion für den Button
              },
            ),
          ),
        ],
      ),
    );
  }
}
