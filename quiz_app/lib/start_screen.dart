import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/styled_button_with_icon.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: Color.fromARGB(205, 255, 255, 255),
          ),
          const SizedBox(height: 35),
          StyledText("Welcome to test your knowledge of Flutter!", 25),
          const SizedBox(height: 35),
          StyledButtonWithIcon("Start Quiz", 20)
       ]
      )
    );
  }
}
