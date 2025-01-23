import 'package:flutter/material.dart';

class ProductCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(20, 0); // Start oben links (mit Rundung)
    path.lineTo(size.width - 20, 0); // Gerade obere Linie
    path.quadraticBezierTo(
        size.width, 0, size.width, 20); // Oben rechts abgerundet
    path.lineTo(size.width, size.height - 60); // Rechte kürzere Seite
    path.quadraticBezierTo(size.width, size.height - 40, size.width - 20,
        size.height - 40); // Unten rechts abgerundet
    path.lineTo(
        20, size.height); // Schräge Linie von unten rechts nach links oben
    path.quadraticBezierTo(
        0, size.height, 0, size.height - 20); // Unten links abgerundet
    path.lineTo(0, 20); // Linke lange Seite
    path.quadraticBezierTo(0, 0, 20, 0); // Oben links abgerundet
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
