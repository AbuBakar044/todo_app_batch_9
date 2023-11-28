import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;

  const MyText({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
