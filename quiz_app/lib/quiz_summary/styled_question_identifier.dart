import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledQuestionIdentifier extends StatelessWidget {
  final Color color;
  final String questionId;

  const StyledQuestionIdentifier(this.questionId, this.color, {super.key});

  @override
  Widget build(context) {
    return ClipOval(
      child: Container (
        alignment: Alignment.center,
        height: 45,
        width: 45,
        color: color,
        child: Text(
          questionId,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}