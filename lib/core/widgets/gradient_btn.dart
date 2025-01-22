import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.padding,
    this.contentGradient,
    this.strokeGradient,
    this.strokeWidth,
    this.shadows,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Gradient? contentGradient;
  final Gradient? strokeGradient;
  final double? strokeWidth;
  final List<BoxShadow>? shadows;

  // Berechnung der dynamischen Breite basierend auf Text
  double _calculateWidth(BuildContext context, BoxConstraints constraints) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        );

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.size.width;
    return width ?? textWidth + (padding?.horizontal ?? 32);
  }

  // Schattenebene
  Widget _buildShadowLayer(double width, double height) {
    return Positioned.fill(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: shadows ??
              [
                BoxShadow(
                  color:
                      SnackishColors.shadowBerry.withAlpha((0.8 * 255).toInt()),
                  blurRadius: 24,
                  offset: const Offset(0, -3),
                ),
                BoxShadow(
                  color:
                      SnackishColors.shadowPink.withAlpha((0.7 * 255).toInt()),
                  blurRadius: 15,
                  offset: Offset.zero,
                ),
                BoxShadow(
                  color:
                      SnackishColors.shadowCandy.withAlpha((0.6 * 255).toInt()),
                  blurRadius: 90,
                  offset: const Offset(0, 30),
                ),
              ],
        ),
      ),
    );
  }

  // Button-Inhalt mit InkWell
  Widget _buildButtonContent(
      BuildContext context, double width, double height) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: contentGradient ?? SnackishGradients.buttonOrderNowGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildOverlayLayer(),
              _buildStrokeLayer(width, height),
              _buildTextContent(context),
            ],
          ),
        ),
      ),
    );
  }

  // Overlay mit Blur
  Widget _buildOverlayLayer() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: SnackishGradients.overlayGradient,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  // Stroke mit ShaderMask
  Widget _buildStrokeLayer(double width, double height) {
    return Positioned.fill(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return (strokeGradient ?? SnackishGradients.strokeGradient)
              .createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: strokeWidth ?? 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  // Textinhalt
  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dynamicWidth = _calculateWidth(context, constraints);
        final dynamicHeight = height ?? 60;

        return Stack(
          alignment: Alignment.center,
          children: [
            if (shadows != null) _buildShadowLayer(dynamicWidth, dynamicHeight),
            _buildButtonContent(context, dynamicWidth, dynamicHeight),
          ],
        );
      },
    );
  }
}
