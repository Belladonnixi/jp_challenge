import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

abstract class SnackishGradients {
  // **Button-Gradients**
  static RadialGradient buttonOrderNowGradient = RadialGradient(
    colors: [
      SnackishColors.buttonGradientStart1,
      SnackishColors.buttonGradientEnd1,
    ],
    center: Alignment.bottomRight,
    radius: 1.5,
  );

  static LinearGradient buttonAddToOrderGradient = LinearGradient(
    colors: [
      SnackishColors.buttonGradientStart2,
      SnackishColors.buttonGradientEnd2,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // **Card View Gradients**
  static LinearGradient cardViewGlassEffectGradient = LinearGradient(
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
    stops: [0.07, 0.61, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // **Zusätzliche Gradients**
  static LinearGradient overlayGradient = LinearGradient(
    colors: [
      SnackishColors.overlayBlackLow,
      SnackishColors.transparentWhiteMedium,
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient strokeGradient = LinearGradient(
    colors: [
      SnackishColors.solidGradientPink,
      Colors.transparent,
      SnackishColors.solidGradientPink,
    ],
    stops: [0.0, 0.6, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  );
}
