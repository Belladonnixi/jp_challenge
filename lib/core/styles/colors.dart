import 'dart:ui';

abstract class SnackishColors {
  // **Grundfarben (Solid Colors)**
  static const Color solidGradientBlue = Color(0xFF437A97);
  static const Color solidDarkChocolate = Color(0xFF2F2B22);
  static const Color solidGradientPink = Color(0xFFE98796);
  static const Color solidGradientLightPurple = Color(0xFF908CF5);
  static const Color solidGradientPurple = Color(0xFF8C5BEA);
  static const Color solidCreamWhite = Color(0xFFFFFFFF);
  static const Color solidSoftPink = Color(0xFFBB8DE1);

  // **Transparente Akzente (mit withAlpha)**
  static Color transparentWhiteLow =
      solidCreamWhite.withAlpha((0.01 * 255).toInt());
  static Color transparentWhiteMedium =
      solidCreamWhite.withAlpha((0.3 * 255).toInt());
  static Color transparentWhiteHigh =
      solidCreamWhite.withAlpha((0.7 * 255).toInt());

  // **Buttonfarben (Radial Gradient Stops)**
  static const Color buttonGradientStart1 = Color(0xFFF69AA3);
  static const Color buttonGradientEnd1 = Color(0xFFE970C4);
  static const Color buttonGradientStart2 = Color(0xFFE98796);
  static const Color buttonGradientEnd2 = Color(0xFF8C5BEA);

  // **Stroke-Farben (mit withAlpha)**
  static Color strokeWhite50 = solidCreamWhite.withAlpha((0.5 * 255).toInt());
  static Color strokeDark50 = Color(0xFF000000).withAlpha((0.5 * 255).toInt());

  // **Schattenfarben**
  static const Color shadowBerry = Color(0xFF9375B6);
  static const Color shadowPink = Color(0xFFFFACE4);
  static const Color shadowCandy = Color(0xFFEA71C5);

  // **Zusätzliche Akzente**
  static const Color overlayBlackLow = Color(0x0D000000);
  static const Color overlayWhiteMedium = Color(0x80FFFFFF);
}
