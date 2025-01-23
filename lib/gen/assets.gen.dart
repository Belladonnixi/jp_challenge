/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsBackgroundsGen {
  const $AssetsBackgroundsGen();

  /// File path: assets/backgrounds/bg_mainscreen.png
  AssetGenImage get bgMainscreen =>
      const AssetGenImage('assets/backgrounds/bg_mainscreen.png');

  /// File path: assets/backgrounds/bg_startscreen.png
  AssetGenImage get bgStartscreen =>
      const AssetGenImage('assets/backgrounds/bg_startscreen.png');

  /// List of all assets
  List<AssetGenImage> get values => [bgMainscreen, bgStartscreen];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cancel.svg
  String get cancel => 'assets/icons/cancel.svg';

  /// File path: assets/icons/gluten_free.svg
  String get glutenFree => 'assets/icons/gluten_free.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/heart_filled.svg
  String get heartFilled => 'assets/icons/heart_filled.svg';

  /// File path: assets/icons/kcal.svg
  String get kcal => 'assets/icons/kcal.svg';

  /// File path: assets/icons/low_fat.svg
  String get lowFat => 'assets/icons/low_fat.svg';

  /// File path: assets/icons/lunch.svg
  String get lunch => 'assets/icons/lunch.svg';

  /// File path: assets/icons/minus.svg
  String get minus => 'assets/icons/minus.svg';

  /// File path: assets/icons/plus.svg
  String get plus => 'assets/icons/plus.svg';

  /// File path: assets/icons/something.svg
  String get something => 'assets/icons/something.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// File path: assets/icons/star_filled.svg
  String get starFilled => 'assets/icons/star_filled.svg';

  /// File path: assets/icons/sugar_free.svg
  String get sugarFree => 'assets/icons/sugar_free.svg';

  /// List of all assets
  List<String> get values => [
        cancel,
        glutenFree,
        heart,
        heartFilled,
        kcal,
        lowFat,
        lunch,
        minus,
        plus,
        something,
        star,
        starFilled,
        sugarFree
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/burger.png
  AssetGenImage get burger => const AssetGenImage('assets/images/burger.png');

  /// File path: assets/images/cupcake_1.png
  AssetGenImage get cupcake1 =>
      const AssetGenImage('assets/images/cupcake_1.png');

  /// File path: assets/images/cupcake_2.png
  AssetGenImage get cupcake2 =>
      const AssetGenImage('assets/images/cupcake_2.png');

  /// File path: assets/images/ice_cream_1.png
  AssetGenImage get iceCream1 =>
      const AssetGenImage('assets/images/ice_cream_1.png');

  /// File path: assets/images/ice_cream_2.png
  AssetGenImage get iceCream2 =>
      const AssetGenImage('assets/images/ice_cream_2.png');

  /// File path: assets/images/ice_cream_3.png
  AssetGenImage get iceCream3 =>
      const AssetGenImage('assets/images/ice_cream_3.png');

  /// File path: assets/images/snack_snack.png
  AssetGenImage get snackSnack =>
      const AssetGenImage('assets/images/snack_snack.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [burger, cupcake1, cupcake2, iceCream1, iceCream2, iceCream3, snackSnack];
}

class Assets {
  Assets._();

  static const $AssetsBackgroundsGen backgrounds = $AssetsBackgroundsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
