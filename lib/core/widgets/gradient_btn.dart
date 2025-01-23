import 'package:flutter/material.dart';
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

  // Berechnet die dynamische Breite basierend auf dem Text und dem Padding.
  double _calculateWidth(BuildContext context, BoxConstraints constraints) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        );

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout(); // Layout sorgt dafür, dass die Textgröße gemessen werden kann.

    final textWidth = textPainter.size.width; // Breite des Textes.
    return width ??
        textWidth +
            (padding?.horizontal ??
                40); // Berechnet die Gesamtdynamische Breite (Text + Padding).
  }

  // Erstellt die Schattenebene hinter dem Button.
  Widget? _buildShadowLayer(double width, double height) {
    // Null-Check und Abfrage, ob die Liste leer ist.
    if (shadows?.isEmpty ?? true) {
      return null; // Gibt nichts zurück, wenn keine Schatten definiert sind.
    }

    return Positioned(
      child: Container(
        width: width, // Breite des Schattens.
        height: height, // Höhe des Schattens.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Abgerundete Ecken.
          boxShadow: shadows, // Verwendet die definierten Schatten.
        ),
      ),
    );
  }

  // Der Hauptinhalt des Buttons mit einem "InkWell" für die Klick-Aktion.
  Widget _buildButtonContent(
      BuildContext context, double width, double height) {
    return Material(
      color: Colors
          .transparent, // Der Hintergrund des Materials bleibt transparent.
      borderRadius:
          BorderRadius.circular(10), // Gleiche Ecken wie der Button selbst.
      child: Ink(
        width: width, // Die Breite des Buttons.
        height: height, // Die Höhe des Buttons.
        decoration: BoxDecoration(
          gradient: contentGradient ??
              SnackishGradients
                  .buttonOrderNowGradient, // Farbverlauf des Buttons.
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed, // Hier wird die Callback-Funktion ausgeführt.
          borderRadius: BorderRadius.circular(
              10), // Abgerundete Kanten für das Feedback (z. B. Splash).
          splashColor: Colors.white
              .withAlpha((0.2 * 255).toInt()), // Farbe des Klick-Effekts.
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildStrokeLayer(
                  width, height), // Zeichnet den Rand (Stroke) des Buttons.
              _buildTextContent(context), // Zeigt den Button-Text an.
            ],
          ),
        ),
      ),
    );
  }

  // Zeichnet den Rand (Stroke) des Buttons mit einer ShaderMask.
  Widget _buildStrokeLayer(double width, double height) {
    return Positioned.fill(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return (strokeGradient ??
                  SnackishGradients.strokeGradient) // Farbverlauf des Strokes.
              .createShader(
                  bounds); // Erzeugt den Farbverlauf passend zur Größe des Buttons.
        },
        blendMode: BlendMode.srcIn, // Der Farbverlauf wird direkt angewendet.
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white, // Standardfarbe des Strokes.
              width: strokeWidth ?? 1.5, // Die Breite des Strokes.
            ),
            borderRadius:
                BorderRadius.circular(10), // Abgerundete Ecken für den Rand.
          ),
        ),
      ),
    );
  }

  // Baut den Textinhalt des Buttons.
  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Standard-Padding für den Text.
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white, // Weißer Text.
              fontWeight: FontWeight.bold, // Fetter Text.
              fontSize: 18, // Textgröße.
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamische Breite und Höhe basierend auf den Textinhalten oder Standardwerten.
        final dynamicWidth = _calculateWidth(context, constraints);
        final dynamicHeight = height ?? 48.0;

        return Stack(
          alignment: Alignment.center, // Zentriert den Button-Inhalt.
          children: [
            // Schattenebene nur einfügen, wenn sie nicht null ist.
            if (_buildShadowLayer(dynamicWidth, dynamicHeight) != null)
              _buildShadowLayer(dynamicWidth, dynamicHeight)!,
            // Baut den Button-Inhalt.
            _buildButtonContent(context, dynamicWidth, dynamicHeight),
          ],
        );
      },
    );
  }
}
