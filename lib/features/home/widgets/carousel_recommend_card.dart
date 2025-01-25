import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/features/home/widgets/recommend_card.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class CarouselRecommendCard extends StatelessWidget {
  const CarouselRecommendCard({
    super.key,
    required this.product,
    required this.onPressed,
  });

  final Product product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RecommendCard(
      width: 200,
      height: 320,
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: product.image.image(
              fit: BoxFit.contain,
              height: 140,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  product.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4,
            children: [
              SvgPicture.asset(
                Assets.icons.something,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 14,
                height: 14,
              ),
              Text(
                product.price,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: SnackishColors.solidCreamWhite,
                    ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: SnackishColors.solidCreamWhite
                        .withAlpha((0.7 * 255).toInt()),
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.ratings,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 15,
                          color: SnackishColors.solidCreamWhite
                              .withAlpha((0.7 * 255).toInt()),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
