import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';

class OrderGradientBtn extends StatelessWidget {
  const OrderGradientBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Schatten
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      SnackishColors.shadowBerry.withAlpha((0.8 * 255).toInt()),
                  blurRadius: 24,
                  offset: Offset(0, -3),
                ),
                BoxShadow(
                  color:
                      SnackishColors.shadowPink.withAlpha((0.7 * 255).toInt()),
                  blurRadius: 15,
                  offset: Offset(0, 0),
                ),
                BoxShadow(
                  color:
                      SnackishColors.shadowCandy.withAlpha((0.6 * 255).toInt()),
                  blurRadius: 90,
                  offset: Offset(0, 30),
                ),
              ],
            ),
          ),
        ),
        // Button-Inhalt mit InkWell
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              gradient: SnackishGradients.buttonOrderNowGradient,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: onPressed,
              splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Stroke mit ShaderMask
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return SnackishGradients.strokeGradient
                          .createShader(bounds);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  // Overlay Gradient
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: SnackishGradients.overlayGradient,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  // Text
                  Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
