import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/utils/product_card_clipper.dart';
import 'package:jp_challenge/core/utils/product_card_painter.dart';

class ProductGlassCard extends StatelessWidget {
  const ProductGlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.height,
    this.width,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProductCardPainter(),
      child: ClipPath(
        clipper: ProductCardClipper(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 45.0, sigmaY: 45.0),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            color:
                SnackishColors.solidCreamWhite.withAlpha((0.01 * 255).toInt()),
            child: child,
          ),
        ),
      ),
    );
  }
}
