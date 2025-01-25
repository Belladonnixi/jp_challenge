import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/gradients.dart';

/*
 * GradientBtn
 * 
 * dieser Ansatz weil Elevated Buttons keine Gradients nehmen und hier dann folgend genauer erklärt.
 *
 * Ein vollständig anpassbarer Button mit:
 * - **Gradient-Hintergrund**: Ein Farbverlauf, der über den gesamten Button gelegt wird.
 * - **Stroke**: Ein optionaler Rahmen mit eigenem Farbverlauf.
 * - **Shadows**: Anpassbare Schattenebenen, die unterhalb des Buttons gerendert werden.
 * - **InkWell-Effekt**: Ripple-Effekt für visuelles Feedback bei der Interaktion.
 *
 * Aufbau:
 * Der Button besteht aus folgenden Ebenen, die mit einem Stack verschachtelt sind:
 * 1. Shadow Layer (optional):
 *    - Eine Ebene, die die Schatten des Buttons rendert.
 *    - Schatten können über die `shadows`-Eigenschaft angepasst oder deaktiviert werden.
 * 2. Button Content:
 *    - Hauptinhalt des Buttons, der den Hintergrund (Gradient), den Stroke und den Text enthält.
 *    - Enthält ein Material-Widget für den InkWell-Ripple-Effekt.
 * 3. Stroke Layer:
 *    - Ein optionaler Rahmen mit einem Farbverlauf, der um den Button gezogen wird.
 *    - Wird über eine ShaderMask realisiert, um den Farbverlauf passend zum Rahmen anzuwenden.
 * 4. Text Layer:
 *    - Der Textinhalt des Buttons, der mit einem Text-Widget gerendert wird.
 *    - Text ist vollständig anpassbar (z. B. Farbe, Größe, Gewicht).
 *
 * Anpassungsoptionen:
 * - `width` und `height`: Manuelle Größenanpassung des Buttons (optional).
 * - `contentGradient`: Der Farbverlauf für den Button-Hintergrund.
 * - `strokeGradient`: Der Farbverlauf für den Button-Rahmen.
 * - `strokeWidth`: Breite des Rahmens.
 * - `shadows`: Liste von BoxShadow, um die Schattenebenen zu definieren.
 * - `padding`: Innenabstände des Buttons (Text vs. Rand).
 *
 * Verwendung:
 * GradientBtn(
 *   text: "Order Now",
 *   onPressed: () {
 *     print("Button pressed!");
 *   },
 *   width: 200,
 *   height: 50,
 *   contentGradient: LinearGradient(
 *     colors: [Colors.blue, Colors.purple],
 *   ),
 *   strokeGradient: LinearGradient(
 *     colors: [Colors.white, Colors.transparent],
 *   ),
 *   strokeWidth: 2.0,
 *   shadows: [
 *     BoxShadow(
 *       color: Colors.black.withOpacity(0.2),
 *       blurRadius: 10,
 *       offset: Offset(0, 4),
 *     ),
 *   ],
 * );
 *
 * Vorteile:
 * - Modularer Aufbau: Jede Komponente (Shadow, Stroke, Text) ist separat anpassbar.
 * - Dynamische Größe: Breite und Höhe passen sich automatisch an den Text an, falls nicht explizit gesetzt.
 * - Wiederverwendbar: Ideal für Buttons mit modernem Design und interaktivem Feedback.
 */

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.padding,
    this.contentGradient,
    this.strokeGradient,
    this.strokeWidth,
    this.shadows,
    this.overlayGradient,
  });

  final Widget title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Gradient? contentGradient;
  final Gradient? strokeGradient;
  final Gradient? overlayGradient;
  final double? strokeWidth;
  final List<BoxShadow>? shadows;

  // Berechnet die dynamische Breite basierend auf dem Titel und dem Padding.
  double _calculateWidth(BuildContext context) {
    // Überprüfen, ob `title` ein Text-Widget ist und Daten enthält.
    if (title is Text && (title as Text).data != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: (title as Text).data,
          style: (title as Text).style ??
              Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final contentWidth = textPainter.size.width; // Breite des Textinhalts.
      // Hinzufügen von Padding (Standardwert oder benutzerdefiniert).
      return width ?? contentWidth + (padding?.horizontal ?? 40);
    }

    // Fallback: Wenn `title` kein Text-Widget ist, eine Standardbreite verwenden.
    return width ?? 100.0; // Standardbreite als Fallback.
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

  // Funktion zum Erstellen der Overlay-Gradient-Schicht
  Widget? _buildOverlayLayer(double width, double height) {
    if (overlayGradient == null) {
      return null; // Falls kein Overlay-Gradient definiert ist, nichts hinzufügen
    }

    return Positioned.fill(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: overlayGradient, // Der zusätzliche Farbverlauf
          borderRadius: BorderRadius.circular(10), // Abgerundete Ecken
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
          // Abgerundete Kanten für das Feedback hier riffle Effekt das man auch vom elevated Button kennt.
          borderRadius: BorderRadius.circular(10),
          // Farbe des tap Effekts.
          splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (_buildOverlayLayer(width, height) != null)
                _buildOverlayLayer(width, height)!,
              _buildStrokeLayer(
                  width, height), // Zeichnet den Rand (Stroke) des Buttons.
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamische Breite und Höhe basierend auf den Textinhalten oder Standardwerten.
        final dynamicWidth = _calculateWidth(context);
        final dynamicHeight = height ?? 48.0;

        return Stack(
          alignment: Alignment.center, // Zentriert den Button-Inhalt.
          children: [
            // Schattenebene nur einfügen, wenn sie nicht null ist.
            if (_buildShadowLayer(dynamicWidth, dynamicHeight) != null)
              _buildShadowLayer(dynamicWidth, dynamicHeight)!,
            // Baut den Button-Inhalt.
            _buildButtonContent(context, dynamicWidth, dynamicHeight),
            Positioned(
              top: 8,
              child: title,
            ),
          ],
        );
      },
    );
  }
}
