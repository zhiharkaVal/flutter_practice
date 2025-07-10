
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_summary/styled_question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> questionData;
  const SummaryItem(this.questionData, {super.key});

  Color getAnswerColor(bool isCorrectlyAnswered) {
    Color answerColor = Colors.white;
    answerColor = isCorrectlyAnswered ? Color.fromARGB(180, 4, 93, 61) : Color.fromARGB(255, 220, 77, 77);
    return answerColor;
  }

  @override
  Widget build(context) {
    final isCorrectlyAnswered =
        questionData['user_answer'].toString() == questionData['correct_answer'].toString();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        StyledQuestionIdentifier(
          questionData['question_index'].toString(),
          getAnswerColor(isCorrectlyAnswered)
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionData['question'].toString(),
                style: GoogleFonts.lato(fontSize: 20),
                textAlign: TextAlign.left,

              ),
              Text(
                questionData['correct_answer'].toString(),
                style: GoogleFonts.lato(fontSize: 15, color: Color.fromARGB(180, 4, 93, 61)),
                textAlign: TextAlign.left,
              ),
              Text(
                questionData['user_answer'].toString(),
                style: GoogleFonts.lato (
                  fontSize: 15,
                  color: getAnswerColor(isCorrectlyAnswered)
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ]
    );
  }
}
