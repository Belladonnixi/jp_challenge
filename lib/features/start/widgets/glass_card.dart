import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 45.0, sigmaY: 45.0),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color:
                SnackishColors.solidCreamWhite.withAlpha((0.01 * 255).toInt()),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color:
                  SnackishColors.solidCreamWhite.withAlpha((0.3 * 255).toInt()),
              width: 0.7,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
