import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 8,
          children: [
            Assets.icons.glutenFree.image(
              color: SnackishColors.solidCreamWhite,
              width: 24,
              height: 24,
            ),
            Assets.icons.sugarFree.image(
              color: SnackishColors.solidCreamWhite,
              width: 24,
              height: 24,
            ),
            Assets.icons.lowFat.image(
              color: SnackishColors.solidCreamWhite,
              width: 24,
              height: 24,
            ),
            Assets.icons.kcal.image(
              color: SnackishColors.solidCreamWhite,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ],
    );
  }
}
