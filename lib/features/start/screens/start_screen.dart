import 'package:flutter/material.dart';
import 'package:jp_challenge/core/widgets/order_btn.dart';
import 'package:jp_challenge/features/start/widgets/glass_card.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Assets.backgrounds.bgStartscreen.image(
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 105,
            left: -20,
            child: Assets.images.cupcake1.image(
              height: 550,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 450,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Assets.images.snackSnack.image(
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 85,
            left: 24,
            right: 24,
            child: GlassCard(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Feeling Snackish Today?',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore Angi\'s most popular snack selection\nand get instantly happy.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  OrderBtn(
                    title: 'Order Now',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
