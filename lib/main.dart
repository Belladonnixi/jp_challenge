import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/theme.dart';
import 'package:jp_challenge/core/widgets/standard_btn.dart';

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
          child: OrderGradientBtn(
            text: 'order now ',
            onPressed: () {},
          ),
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
