class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffleAnswers() {
    final shuffeledAnswers = List.of(answers);
    shuffeledAnswers.shuffle();
    return shuffeledAnswers;
  }
}
