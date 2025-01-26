import 'package:flutter_svg/svg.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/widgets/order_btn.dart';
import 'package:jp_challenge/features/details/widgets/details_card.dart';
import '../widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/features/details/widgets/size_selector.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

class DetailsBottomSheet extends StatelessWidget {
  const DetailsBottomSheet({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(Assets.backgrounds.bgBottomsheet.path),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 200),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizeSelector(),
                  ProductCounter(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                child: OrderBtn(
                  width: double.infinity,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add to Order for ',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: SnackishColors.solidCreamWhite,
                            ),
                      ),
                      SvgPicture.asset(
                        Assets.icons.something,
                        colorFilter: const ColorFilter.mode(
                            SnackishColors.solidCreamWhite, BlendMode.srcIn),
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.price,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: SnackishColors.solidCreamWhite,
                            ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        // Bild oben
        Positioned(
          top: -120,
          left: 0,
          right: 0,
          child: Center(
            child: ClipOval(
              child: Image.asset(
                product.image.path,
                height: 350,
                width: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Karte (schwebend)
        Positioned(
          top: 150,
          left: 24,
          right: 24,
          child: DetailsCard(product: product),
        ),
      ],
    );
  }
}
