import 'dart:ui';

abstract class SnackishColors {
  // **Grundfarben (Solid Colors)**
  static const Color solidGradientBlue = Color.fromARGB(255, 67, 122, 151);
  static const Color solidDarkChocolate = Color.fromARGB(255, 47, 43, 34);
  static const Color solidGradientPink = Color.fromARGB(255, 233, 135, 150);
  static const Color solidGradientPurple = Color.fromARGB(255, 140, 91, 234);
  static const Color solidCreamWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color solidSoftPink = Color.fromARGB(255, 187, 141, 224);

  // **Transparente Akzente (mit withAlpha)**
  static Color transparentWhiteLow =
      solidCreamWhite.withAlpha((0.01 * 255).toInt());
  static Color transparentWhiteMedium =
      solidCreamWhite.withAlpha((0.3 * 255).toInt());
  static Color transparentWhiteHigh =
      solidCreamWhite.withAlpha((0.7 * 255).toInt());

  // **Buttonfarben (Radial Gradient Stops)**
  static Color buttonGradientStart1 = Color.fromARGB(255, 246, 154, 163);
  static Color buttonGradientEnd1 = Color.fromARGB(255, 233, 112, 196);
  static Color buttonGradientStart2 = Color.fromARGB(255, 233, 135, 150);
  static Color buttonGradientEnd2 = Color.fromARGB(255, 140, 91, 234);

  // **Stroke-Farben (mit withAlpha)**
  static Color strokeWhite50 = solidCreamWhite.withAlpha((0.5 * 255).toInt());
  static Color strokeDark50 =
      Color.fromARGB(255, 0, 0, 0).withAlpha((0.5 * 255).toInt());

  // **Schattenfarben**
  static const Color shadowBerry = Color.fromARGB(255, 147, 117, 182);
  static const Color shadowPink = Color.fromARGB(255, 255, 172, 228);
  static const Color shadowCandy = Color.fromARGB(128, 234, 113, 197);

  // **Zusätzliche Akzente**
  static Color overlayBlackLow = Color.fromARGB((0.05 * 255).toInt(), 0, 0, 0);
  static Color overlayWhiteMedium =
      solidCreamWhite.withAlpha((0.5 * 255).toInt());
}
