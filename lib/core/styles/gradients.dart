import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

abstract class SnackishGradients {
  // **Button-Gradients**
  static RadialGradient buttonOrderNowGradient = const RadialGradient(
    colors: [
      SnackishColors.buttonGradientStart1,
      SnackishColors.buttonGradientEnd1,
    ],
    center: Alignment.bottomRight,
    radius: 3.5,
  );

  static RadialGradient buttonAddToOrderGradient = const RadialGradient(
    colors: [
      SnackishColors.buttonGradientStart2 /* .withAlpha((0.5 * 255).toInt()) */,
      SnackishColors.buttonGradientEnd2,
    ],
    center: Alignment.centerLeft,
    radius: 2.5,
  );

  // **Card View Gradients**
  static LinearGradient cardViewGlassEffectGradient = const LinearGradient(
    colors: [
      SnackishColors.overlayWhiteMedium,
      SnackishColors.overlayBlackLow,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient cardViewBackgroundGradient = LinearGradient(
    colors: [
      SnackishColors.transparentWhiteLow,
      SnackishColors.solidGradientLightPurple,
      SnackishColors.solidGradientPurple,
    ],
    stops: const [0.07, 0.61, 1.0],
    begin: const Alignment(0.0, -1.3),
    end: Alignment.bottomCenter,
  );

  // **Zusätzliche Gradients**
  static LinearGradient overlayGradient = LinearGradient(
    colors: [
      SnackishColors.overlayBlackLow,
      SnackishColors.transparentWhiteMedium,
    ],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient strokeGradient = LinearGradient(
    colors: [
      SnackishColors.solidCreamWhite.withAlpha((0.4 * 255).toInt()),
      Colors.transparent,
      SnackishColors.buttonGradientEnd1,
    ],
    stops: const [0.0, 0.6, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  );
}
