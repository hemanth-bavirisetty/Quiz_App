import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.retakeQuiz,
  });
  final void Function() retakeQuiz;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestins = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestins out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 201, 235),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //const Text('List of Questions and answers.'),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: const Icon(Icons.replay_outlined),
              onPressed: retakeQuiz,
              label: const Text('Retake Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                backgroundColor: const Color.fromARGB(17, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
