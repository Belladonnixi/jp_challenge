import 'package:flutter/material.dart';

mixin ProductCardPathMixin {
  Path createProductCardPath(Size size) {
    final path = Path();
    path.moveTo(30, 0); // Start oben links (mit Rundung)
    path.lineTo(size.width - 30, 0); // Gerade obere Linie
    path.quadraticBezierTo(
        size.width, 0, size.width, 25); // Oben rechts abgerundet
    path.lineTo(size.width, size.height - 69); // Rechte kürzere Seite
    // Unten rechts abgerundet
    path.quadraticBezierTo(
        size.width, size.height - 40, size.width - 20, size.height - 35);
    // Schräge Linie von unten rechts nach links oben
    path.lineTo(30, size.height);
    // Unten links abgerundet
    path.quadraticBezierTo(0, size.height, 0, size.height - 25);
    path.lineTo(0, 30); // Linke lange Seite
    path.quadraticBezierTo(0, 0, 30, 0); // Oben links abgerundet
    path.close(); // Schließt den Pfad, damit er komplett ist
    return path;
  }
}
