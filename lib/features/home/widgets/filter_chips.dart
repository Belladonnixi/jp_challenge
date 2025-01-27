import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/widgets/glass_card.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class FilterChips extends StatelessWidget {
  FilterChips({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final String selectedCategory;
  final Function(String) onCategorySelected;

  final List<String> categories = [
    'All categories',
    'Salty',
    'Sweet',
    'Drinks',
  ];

  Widget _buildSelectedChip(String category) {
    return Container(
      decoration: BoxDecoration(
        color: SnackishColors.solidCreamWhite.withAlpha((0.7 * 255).toInt()),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: SnackishColors.solidCreamWhite.withAlpha((0.5 * 255).toInt()),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (category == 'All categories') ...[
              Assets.icons.lunch.image(
                color: Colors.black,
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              category,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (category == 'All categories') ...[
              const SizedBox(width: 4),
              const Icon(Icons.expand_more, color: Colors.black, size: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUnselectedChip(String category) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          if (category == 'All categories') ...[
            Assets.icons.lunch.image(
              color: SnackishColors.solidCreamWhite,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            category,
            style: TextStyle(
              color:
                  SnackishColors.solidCreamWhite.withAlpha((0.7 * 255).toInt()),
              fontWeight: FontWeight.normal,
            ),
          ),
          if (category == 'All categories') ...[
            const SizedBox(width: 4),
            const Icon(Icons.expand_more,
                color: SnackishColors.solidCreamWhite, size: 16),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          children: categories.map((category) {
            final bool isSelected = category == selectedCategory;

            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => onCategorySelected(category),
                child: isSelected
                    ? _buildSelectedChip(category)
                    : _buildUnselectedChip(category),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
