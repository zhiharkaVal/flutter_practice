import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StyledAnswerOptButton extends StatelessWidget {
  final String answerOption;
  final void Function() onClick;
  const StyledAnswerOptButton(this.answerOption, this.onClick, {super.key});

  @override
  Widget build(context) {
    return Container (
        margin: EdgeInsets.symmetric(vertical: 2.5),
        child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(180, 4, 37, 26),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: StyledText(answerOption, 22)
      ),
    );
  }
}