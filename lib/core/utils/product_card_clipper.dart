import 'package:flutter/material.dart';
import 'package:jp_challenge/core/utils/product_card_path_mixin.dart';

class ProductCardClipper extends CustomClipper<Path> with ProductCardPathMixin {
  @override
  Path getClip(Size size) => createProductCardPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
