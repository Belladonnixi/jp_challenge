import 'package:flutter/material.dart';
import 'package:jp_challenge/core/styles/colors.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 1;

  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  void _decrementCounter() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey[600]!,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: SnackishColors.solidCreamWhite,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          icon: Icons.remove,
          onPressed: _decrementCounter,
        ),
        Text(
          '$count',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
        ),
        _buildIconButton(
          icon: Icons.add,
          onPressed: _incrementCounter,
        ),
      ],
    );
  }
}
