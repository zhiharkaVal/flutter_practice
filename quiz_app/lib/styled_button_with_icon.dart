import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StyledButtonWithIcon extends StatelessWidget {
  final String text;
  final double fontSize;
  const StyledButtonWithIcon(this.text, this.fontSize, {super.key});

  @override
  Widget build(context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(180, 34, 69, 57),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(
        Icons.arrow_forward_rounded
      ),
      label: StyledText(text, fontSize)
    );
  }
}