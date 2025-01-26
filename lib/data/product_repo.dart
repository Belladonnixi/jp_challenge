import 'package:jp_challenge/data/product.dart';
import 'package:jp_challenge/gen/assets.gen.dart';

final List<Product> products = [
  Product(
    title: 'Mogli\'s Cup',
    subtitle: 'Strawberry Cupcake\na fruity delight to brighten your day',
    description:
        'A soft, fluffy cupcake with strawberry frosting and colorful sprinkles. Perfect for any celebration or a moment of indulgence.',
    price: '8,99',
    image: Assets.images.cupcake2,
    ratings: '200',
    category: ProductCategory.sweet,
  ),
  Product(
    title: 'Balu\'s Cup',
    subtitle: 'Pistachio Ice Cream\na creamy indulgence with a nutty twist',
    description:
        'A delightful pistachio ice cream with crunchy toppings and a hint of mint.',
    price: '8,99',
    image: Assets.images.iceCream3,
    ratings: '150',
    category: ProductCategory.sweet,
  ),
  Product(
    title: 'Angi\'s Yummy Burger',
    subtitle: 'Delicious vegan burger\nthat tastes like heaven',
    description:
        'A delicious vegan burger featuring a plant-based patty, fresh lettuce, ripe tomatoes, and vegan cheese. A guilt-free treat that tastes like paradise.',
    price: '13.99',
    image: Assets.images.burger,
    ratings: '250',
    category: ProductCategory.salty,
  ),
  Product(
    title: 'Cherry Bliss',
    subtitle: 'A Sweet Classic\nflavorful, and oh-so-delicious',
    description:
        'A classic vanilla cupcake topped with a juicy cherry and a smooth glaze. Perfect for an afternoon treat or a sweet surprise to brighten your day.',
    price: '8,99',
    image: Assets.images.cupcake1,
    ratings: '50',
    category: ProductCategory.sweet,
  ),
  Product(
    title: 'ChocoPop',
    subtitle: 'Fun on a Stick\nthe ultimate chocolatey fun experience',
    description:
        'A creamy chocolate delight on a stick, wrapped in a crispy chocolate shell. This treat is the perfect balance of fun and indulgence.',
    price: '6,99',
    image: Assets.images.iceCream1,
    ratings: '100',
    category: ProductCategory.sweet,
  ),
  Product(
    title: 'Creamy Cone',
    subtitle: 'The Perfect Cone\nevery bite is a creamy sensation',
    description:
        'Dive into this delightful cone filled with rich chocolate and creamy vanilla, finished with a cherry on top for the perfect blend of flavors.',
    price: '6,99',
    image: Assets.images.iceCream2,
    ratings: '100',
    category: ProductCategory.sweet,
  ),
];
