import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/utils/product_card_path_mixin.dart';

class ProductCardPainter extends CustomPainter with ProductCardPathMixin {
  @override
  void paint(Canvas canvas, Size size) {
    // Erstmal wird ein Paint-Objekt erstellt, das definiert, wie der Rand gezeichnet wird.
    final paint = Paint()
      // die zwei Punkte (..) sind sogenannte "cascading operators", die es erlauben, mehrere Eigenschaften auf einmal zu setzen.
      // man könnte stattdessen auch paint.color = ... schreiben.
      ..color = SnackishColors.solidCreamWhite.withAlpha((0.3 * 255).toInt())
      // Der Stil ist "Stroke", damit nur der Rand gezeichnet wird.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5; // Die Breite des Randes wird auf 3 Pixel gesetzt.

    final path = createProductCardPath(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  // Hier wird gesagt, dass der Painter nicht neu gezeichnet werden muss, wenn sich nichts geändert hat.
}
