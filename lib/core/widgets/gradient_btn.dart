import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/gradients.dart';

/*
 * GradientBtn
 * 
 * dieser Ansatz, weil ElevatedButtons keine Gradients unterstützen und hier mehr Flexibilität benötigt wird.
 *
 * Ein anpassbarer Button mit:
 * - **Gradient-Hintergrund**: Farbverlauf über den gesamten Button.
 * - **Stroke**: Optionaler Rahmen mit eigenem Farbverlauf.
 * - **Shadows**: Anpassbare Schatten, die unterhalb des Buttons gerendert werden.
 * - **InkWell-Effekt**: Ripple-Effekt für visuelles Feedback bei Interaktion.
 *
 * Aufbau:
 * Der Button wird über einen Stack organisiert und besteht aus:
 * 1. **Shadow Layer (optional)**:
 *    - Rendert die Schatten des Buttons.
 *    - Kann über die `shadows`-Eigenschaft angepasst oder deaktiviert werden.
 * 2. **Button Content**:
 *    - Enthält den Farbverlauf (Gradient), den Stroke und den Titel.
 *    - Material-Widget sorgt für den InkWell-Ripple-Effekt.
 * 3. **Stroke Layer**:
 *    - Optionaler Rahmen mit Farbverlauf.
 *    - Über eine ShaderMask wird der Farbverlauf präzise auf den Rahmen angewendet.
 * 4. **Title Layer**:
 *    - Der Button-Titel ist ein Widget (z. B. Text), das frei anpassbar ist.
 *    - Wird zentriert und skaliert, um Umbrüche zu verhindern.
 *
 * Anpassungsoptionen:
 * - `width` und `height`: Manuelle Steuerung der Button-Größe (optional).
 * - `contentGradient`: Farbverlauf für den Button-Hintergrund.
 * - `strokeGradient`: Farbverlauf für den Button-Rahmen.
 * - `strokeWidth`: Breite des Rahmens.
 * - `shadows`: Schatten des Buttons.
 * - `padding`: Innenabstände zwischen Button-Rand und Titel.
 * - `title`: Widget für den Button-Titel (z. B. Text mit Stiloptionen).
 *
 * Verwendung:
 * GradientBtn(
 *   title: Text(
 *     "Order Now",
 *     style: TextStyle(
 *       fontSize: 16,
 *       fontWeight: FontWeight.bold,
 *       color: Colors.white,
 *     ),
 *   ),
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
 * - **Flexibilität**: Alle Komponenten (Shadow, Stroke, Titel) können individuell angepasst werden.
 * - **Responsive Design**: Der Button passt sich dynamisch an den Inhalt an, wenn keine feste Breite gesetzt ist.
 * - **Modulares Konzept**: Kann leicht für verschiedene Anforderungen erweitert werden.
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
  double _calculateWidth(BuildContext context, BoxConstraints constraints) {
    if (width != null) {
      return width!;
    }

    // Prüfen, ob der Titel ein Text-Widget ist, um die Breite basierend auf dem Text zu berechnen
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

      final contentWidth = textPainter.size.width;
      final paddingWidth = (padding?.horizontal ?? 40);

      // Gesamte Breite (Text-Inhalt + Padding)
      return contentWidth + paddingWidth;
    }

    // Standardbreite, wenn kein Text-Widget verwendet wird
    return constraints.maxWidth * 0.5; // 50% der verfügbaren Breite
  }

  // Erstellt die Schattenebene hinter dem Button.
  Widget? _buildShadowLayer(double width, double height) {
    if (shadows?.isEmpty ?? true) {
      return null; // Keine Schatten definiert
    }

    return Positioned(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadows,
        ),
      ),
    );
  }

  // Funktion zum Erstellen der Overlay-Gradient-Schicht
  Widget? _buildOverlayLayer(double width, double height) {
    if (overlayGradient == null) {
      return null; // Kein Overlay definiert
    }

    return Positioned.fill(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: overlayGradient,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Der Hauptinhalt des Buttons mit einem "InkWell" für die Klick-Aktion.
  Widget _buildButtonContent(
      BuildContext context, double width, double height) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: contentGradient ?? SnackishGradients.buttonOrderNowGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (_buildOverlayLayer(width, height) != null)
                _buildOverlayLayer(width, height)!,
              _buildStrokeLayer(width, height),
              Padding(
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: FittedBox(
                  fit: BoxFit.scaleDown, // Verhindert, dass der Text umbricht
                  child: title,
                ),
              ),
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dynamicWidth = _calculateWidth(context, constraints);
        final dynamicHeight = height ?? 48.0;

        return Stack(
          alignment: Alignment.center,
          children: [
            if (_buildShadowLayer(dynamicWidth, dynamicHeight) != null)
              _buildShadowLayer(dynamicWidth, dynamicHeight)!,
            _buildButtonContent(context, dynamicWidth, dynamicHeight),
          ],
        );
      },
    );
  }
}
