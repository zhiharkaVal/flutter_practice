import 'package:flutter/material.dart';
import 'package:quiz_app/styled_answer_opt_button.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void questionAnswered(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container (
        margin: EdgeInsets.all(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(currentQuestion.question, 25),
            const SizedBox(height: 25),
            // 'Three dots' is somewhat similar to flatMap
            ...currentQuestion.shuffledAnswers.map((answerOption) {
              return StyledAnswerOptButton(answerOption, () {
                  questionAnswered(answerOption);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}