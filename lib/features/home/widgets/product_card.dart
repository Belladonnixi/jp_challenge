import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/features/home/widgets/add_to_order_btn.dart';
import 'package:jp_challenge/features/home/widgets/product_glass_card.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
    required this.onAddToOrder,
  });

  final String title;
  final String description;
  final String price;
  final String rating;
  final Widget image;
  final VoidCallback onAddToOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProductGlassCard(
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: -0.5,
                        ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: SnackishColors.shadowCandy,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Beschreibung
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
              // Preis
              Row(
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    Assets.icons.something,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 16,
                    height: 16,
                  ),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              // Button
              AddToOrderBtn(
                title: const Text(
                  'Add to order',
                  style: TextStyle(
                    color: SnackishColors.solidCreamWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                onPressed: onAddToOrder,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Positioned(
          top: -115,
          right: -3,
          child: SizedBox(
            width: 190,
            height: 570,
            child: image,
          ),
        ),
      ],
    );
  }
}
