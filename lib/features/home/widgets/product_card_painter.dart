import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

class ProductCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Erstmal wird ein Paint-Objekt erstellt, das definiert, wie der Rand gezeichnet wird.
    final paint = Paint()
      // die zwei Punkte (..) sind sogenannte "cascading operators", die es erlauben, mehrere Eigenschaften auf einmal zu setzen.
      // man könnte stattdessen auch paint.color = ... schreiben.
      ..color = SnackishColors.solidCreamWhite.withAlpha((0.03 * 255).toInt())
      // Der Stil ist "Stroke", damit nur der Rand gezeichnet wird.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Die Breite des Randes wird auf 3 Pixel gesetzt.

    // Jetzt kommt der Path, der die Form des Rands definiert.
    final path = Path();
    // Start oben links mit einem kleinen Abstand (20 Pixel von links).
    path.moveTo(20, 0);
    // Zeichnet die gerade obere Linie bis fast zur rechten Seite (20 Pixel Abstand von rechts).
    path.lineTo(size.width - 20, 0);
    // Macht die obere rechte Ecke rund.
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    // Zeichnet die rechte Seite, die etwas kürzer ist.
    path.lineTo(size.width, size.height - 60);
    // Rundet die untere rechte Ecke ab.
    path.quadraticBezierTo(
        size.width, size.height - 40, size.width - 20, size.height - 40);
    // Zeichnet die schräge Linie von rechts unten nach links oben.
    path.lineTo(20, size.height);
    // Rundet die untere linke Ecke ab.
    path.quadraticBezierTo(0, size.height, 0, size.height - 20);
    path.lineTo(0, 20); // Zeichnet die linke Seite.
    path.quadraticBezierTo(0, 0, 20, 0); // Rundet die obere linke Ecke ab.
    path.close(); // Schließt den Pfad, damit er komplett ist.

    // Jetzt wird der definierte Path (also die Form) mit dem Paint-Objekt auf die Leinwand (Canvas) gemalt.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  // Hier wird gesagt, dass der Painter nicht neu gezeichnet werden muss, wenn sich nichts geändert hat.
}
