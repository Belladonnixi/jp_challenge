import 'package:flutter/material.dart';
import 'package:jp_challenge/features/start/widgets/start_card.dart';
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
            child: StartCard(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
