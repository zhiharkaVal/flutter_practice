import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((questionSummary) {
            return SummaryItem(questionSummary);
          }).toList(),
        ),
      ),
    );
  }
}