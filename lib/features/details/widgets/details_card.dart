import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/widgets/glass_card.dart';
import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/features/details/widgets/ingredients.dart';
import 'package:jp_challenge/features/details/widgets/reviews.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: SnackishColors.solidCreamWhite,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.white70,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.something,
                colorFilter: const ColorFilter.mode(
                    SnackishColors.solidCreamWhite, BlendMode.srcIn),
                width: 16,
                height: 16,
              ),
              Text(
                product.price,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(
            color: SnackishColors.strokeWhite50,
            thickness: 0.5,
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Ingredients(),
              Reviews(),
            ],
          ),
        ],
      ),
    );
  }
}
