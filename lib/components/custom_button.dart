import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color,
    this.textColor = Colors.white,
    required this.label,
    required this.onPressed,
    this.height,
    this.radius,
  }) : super(key: key);

  final Color? color;
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
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            radius ?? MediaQuery.of(context).size.width / 2,
          ),
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
