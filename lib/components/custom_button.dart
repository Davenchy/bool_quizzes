import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    required this.label,
    required this.onPressed,
    this.height,
    this.radius,
  }) : super(key: key);

  final Color color;
  final Color textColor;
  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? 6),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
