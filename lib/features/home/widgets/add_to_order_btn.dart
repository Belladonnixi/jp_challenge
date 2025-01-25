import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';
import 'package:jp_challenge/core/widgets/gradient_btn.dart';

class AddToOrderBtn extends StatelessWidget {
  const AddToOrderBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding,
  });

  final Widget title;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GradientBtn(
      title: title,
      onPressed: onPressed,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      contentGradient: SnackishGradients.buttonAddToOrderGradient,
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
