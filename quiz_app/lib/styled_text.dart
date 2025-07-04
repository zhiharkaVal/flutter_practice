import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  const StyledText(this.text, this.fontSize, {super.key});

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.roboto(fontSize: fontSize),
      textAlign: TextAlign.center,
    );
  }
}