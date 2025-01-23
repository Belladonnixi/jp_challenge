import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';
import 'package:jp_challenge/core/widgets/gradient_btn.dart';

class OrderBtn extends StatelessWidget {
  const OrderBtn({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GradientBtn(
      text: title,
      onPressed: onPressed,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 64),
      contentGradient: SnackishGradients.buttonOrderNowGradient,
      strokeGradient: SnackishGradients.strokeGradient,
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
