import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text, this.color});

  final String text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17, color: color,
        // fontWeight: FontWeight.w100,
      ),
    );
  }
}
