import 'package:flutter/material.dart';
import 'package:quiz_app/styled_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("foo bar"),
          const SizedBox(height: 25),
          StyledButton("some text", 18),
          StyledButton("some other text", 18)
        ],
      ),
    );
  }
}