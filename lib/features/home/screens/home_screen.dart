import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/data/product_repo.dart';
import 'package:jp_challenge/features/details/screens/details_bottom_sheet.dart';
import 'package:jp_challenge/features/home/widgets/filter_chips.dart';
import 'package:jp_challenge/features/home/widgets/product_card.dart';
import 'package:jp_challenge/features/home/widgets/recommend_carousel.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Salty';

  @override
  Widget build(BuildContext context) {
    final Product? filteredProduct = selectedCategory == 'Drinks'
        ? null
        : products.firstWhere(
            (product) =>
                product.category.toString().split('.').last.toLowerCase() ==
                selectedCategory.toLowerCase(),
            orElse: () => products.first,
          );

    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Assets.backgrounds.bgMainscreen.image(
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 75,
            left: 24,
            right: 24,
            child: Text(
              'Choose Your Favorite\nSnack',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: SnackishColors.solidCreamWhite,
                  ),
            ),
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: FilterChips(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          ),
          Positioned(
            top: 235,
            left: 24,
            right: 24,
            child: filteredProduct != null
                ? ProductCard(
                    title: filteredProduct.title,
                    description: filteredProduct.subtitle,
                    price: filteredProduct.price,
                    rating: filteredProduct.ratings,
                    image: filteredProduct.image.image(fit: BoxFit.contain),
                    onAddToOrder: () {},
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.82,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child:
                                  DetailsBottomSheet(product: filteredProduct),
                            ),
                          );
                        },
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Column(
                      spacing: 24,
                      children: [
                        Assets.images.sadHam.image(
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          '404 No Information Found',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.5,
                                    color: SnackishColors.buttonGradientEnd1,
                                  ),
                        ),
                      ],
                    ),
                  ),
          ),
          const Positioned(
            top: 530,
            left: 24,
            child: Text(
              'We Recommend',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: SnackishColors.solidCreamWhite,
                letterSpacing: -0.5,
              ),
            ),
          ),
          Positioned(
            top: 570,
            bottom: 32,
            child: RecommendCarousel(
              products: products,
            ),
          ),
        ],
      ),
    );
  }
}
