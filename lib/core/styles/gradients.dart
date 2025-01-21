import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

abstract class SnackishGradients {
  // **Hintergrund-Gradients**
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      SnackishColors.solidGradientBlue,
      SnackishColors.solidDarkChocolate,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient liquidElementGradient = LinearGradient(
    colors: [
      SnackishColors.solidGradientPink,
      SnackishColors.solidGradientPurple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // **Button-Gradients**
  static RadialGradient buttonOrderNowGradient = RadialGradient(
    colors: [
      SnackishColors.buttonGradientStart1,
      SnackishColors.buttonGradientEnd1,
    ],
    center: Alignment.center,
    radius: 0.8,
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

  static const LinearGradient cardViewBackgroundGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 144, 140, 245),
      Color.fromARGB(255, 140, 91, 234),
    ],
    stops: [0.07, 0.61, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // **Zusätzliche Gradients**
  static LinearGradient overlayGradient = LinearGradient(
    colors: [
      SnackishColors.overlayBlackLow,
      SnackishColors.overlayWhiteMedium,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient strokeGradient = LinearGradient(
    colors: [
      SnackishColors.strokeDark50,
      SnackishColors.strokeWhite50,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
