import 'package:flutter/material.dart';
import 'package:jp_challenge/core/widgets/order_btn.dart';
import 'package:jp_challenge/core/widgets/glass_card.dart';

class StartCard extends StatelessWidget {
  const StartCard({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
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
            title: Text('Order Now'),
            padding: const EdgeInsets.symmetric(horizontal: 48),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
