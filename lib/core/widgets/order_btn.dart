import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';
import 'package:jp_challenge/core/widgets/gradient_btn.dart';

class OrderBtn extends StatelessWidget {
  const OrderBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.height,
    this.width,
  });

  final Widget title;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GradientBtn(
      title: title,
      width: width,
      onPressed: onPressed,
      height: 48,
      padding: padding,
      contentGradient: SnackishGradients.buttonOrderNowGradient,
      strokeGradient: SnackishGradients.strokeGradient,
      overlayGradient: SnackishGradients.overlayGradient,
      strokeWidth: 1.5,
      shadows: [
        BoxShadow(
          color: SnackishColors.shadowBerry.withAlpha((0.4 * 255).toInt()),
          blurRadius: 24,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: SnackishColors.shadowPink.withAlpha((0.3 * 255).toInt()),
          blurRadius: 15,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: SnackishColors.shadowCandy.withAlpha((0.3 * 255).toInt()),
          blurRadius: 90,
          offset: const Offset(0, 20),
        ),
      ],
    );
  }
}
