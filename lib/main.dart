import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';
import 'package:jp_challenge/core/styles/gradients.dart';
import 'package:jp_challenge/core/styles/theme.dart';
import 'package:jp_challenge/core/widgets/gradient_btn.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miao Miao',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        body: Center(
          child: GradientBtn(
            text: "Order Now",
            onPressed: () => print("Button pressed"),
            contentGradient: SnackishGradients.buttonOrderNowGradient,
            strokeGradient: SnackishGradients.strokeGradient,
            strokeWidth: 1.5,
            shadows: [
              BoxShadow(
                color:
                    SnackishColors.shadowBerry.withAlpha((0.8 * 255).toInt()),
                blurRadius: 24,
                offset: const Offset(0, -3),
              ),
              BoxShadow(
                color: SnackishColors.shadowPink.withAlpha((0.7 * 255).toInt()),
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
          /* OrderGradientBtn(
            text: 'order now ',
            onPressed: () {},
          ), */
        ),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: child,
    );
  }
}
