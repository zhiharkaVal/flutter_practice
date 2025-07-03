import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  const StyledText(this.text, this.fontSize, {super.key});

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}