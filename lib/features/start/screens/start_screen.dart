import 'package:flutter/material.dart';
import 'package:jp_challenge/core/widgets/order_btn.dart';
import 'package:jp_challenge/features/home/widgets/product_glass_card.dart';
import 'package:jp_challenge/features/home/widgets/recommend_card.dart';
import 'package:jp_challenge/features/start/widgets/glass_card.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Assets.backgrounds.bgStartscreen.image(
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            children: [
              Spacer(),
              GlassCard(
                height: 200,
                width: 300,
                child: OrderBtn(
                  title: 'meins mein',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              ProductGlassCard(
                height: 200,
                width: 300,
                child: Text('Product Card'),
              ),
              const SizedBox(height: 16),
              RecommendCard(
                height: 250,
                width: 150,
                child: Text('test'),
              ),
              Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
