import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

class RatingStarsRow extends StatelessWidget {
  const RatingStarsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: SnackishColors.solidCreamWhite, size: 18),
        const Icon(Icons.star, color: SnackishColors.solidCreamWhite, size: 18),
        const Icon(Icons.star, color: SnackishColors.solidCreamWhite, size: 18),
        const Icon(Icons.star, color: SnackishColors.solidCreamWhite, size: 18),
        const Icon(Icons.star_border,
            color: SnackishColors.solidCreamWhite, size: 18),
        const SizedBox(width: 4),
        Text(
          '4.0',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}
