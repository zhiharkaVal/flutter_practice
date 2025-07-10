import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_summary/questions_summary.dart';
import 'package:quiz_app/styled_button_with_icon.dart';
import 'package:quiz_app/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestart;
  const ResultsScreen(this.chosenAnswers, this.onRestart, {super.key});

  // get is useful for transforming method for data mangling into a property
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    chosenAnswers.forEachIndexed((index, answer) {
      summary.add({
        'question_index': index + 1,
        'question': questions[index].question,
        'correct_answer': questions[index].answerOptions[0],
        'user_answer': answer
      });
    });

    return summary;
  }

  @override
  Widget build(context) {
    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((questionData) =>
      questionData['user_answer'] == questionData['correct_answer']
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container (
        margin: const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              "You answered $numberOfCorrectAnswers out of $numberOfQuestions questions correctly!",
              22
            ),
            const SizedBox(height: 20),
            QuestionsSummary(summaryData),
            const SizedBox(height: 20),
            StyledButtonWithIcon("Restart Quiz", 15, Icons.restart_alt_rounded, IconAlignment.start, onRestart)
          ],
        ),
      ),
    );
  }
}