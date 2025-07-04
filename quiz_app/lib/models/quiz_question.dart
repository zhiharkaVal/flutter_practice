class QuizQuestion {
  final String question;
  final List<String> answerOptions;

  const QuizQuestion(this.question, this.answerOptions);

  List<String> getShuffledAnswers() {
    final shuffledAnswerOptions = List.of(answerOptions);
    shuffledAnswerOptions.shuffle();
    return shuffledAnswerOptions;
  }
}