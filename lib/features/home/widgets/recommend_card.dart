import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.height,
    this.width,
    required this.onPressed,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 45.0, sigmaY: 45.0),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
              gradient: SnackishGradients.cardViewBackgroundGradient,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: SnackishColors.solidCreamWhite
                    .withAlpha((0.3 * 255).toInt()),
                width: 0.7,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
