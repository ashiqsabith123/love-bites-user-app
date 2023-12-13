import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  BoldText({super.key, required this.text, required this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // color: color,
        fontSize: 30,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.5,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText(
      {super.key, required this.text, this.color, required this.size});

  final double? size;
  final String text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size, color: color,
        // fontWeight: FontWeight.w100,
      ),
    );
  }
}
