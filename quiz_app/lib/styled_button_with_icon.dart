import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StyledButtonWithIcon extends StatelessWidget {
  final String text;
  final double fontSize;
  final IconData icon;
  final IconAlignment iconAlignment;
  final void Function() onClick;
  const StyledButtonWithIcon(this.text, this.fontSize, this.icon, this.iconAlignment, this.onClick, {super.key});

  @override
  Widget build(context) {
    return TextButton.icon(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 34, 69, 57),
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      ),
      icon: Icon( icon ),
      iconAlignment: iconAlignment,
      label: StyledText(text, fontSize)
    );
  }
}