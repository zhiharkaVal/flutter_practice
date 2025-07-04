import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'start-screen';
  List<String> userAnswers = [];

  void switchScreen() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void userAnswer(String answer) {
    userAnswers.add(answer);

    if (userAnswers.length == questions.length) {
      setState(() {
        currentScreen = "start-screen";
        userAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(180, 9, 111, 131),
                Color.fromARGB(120, 90, 212, 236)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: currentScreen == 'start-screen' ? StartScreen(switchScreen) : QuestionsScreen(onSelectAnswer: userAnswer),
        ),
      ),
    );
  }
}