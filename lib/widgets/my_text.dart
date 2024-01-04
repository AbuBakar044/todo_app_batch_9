import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final String? family;
  final TextAlign? align;

  const MyText({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.color, this.family,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family,
      ),
    );
  }
}
