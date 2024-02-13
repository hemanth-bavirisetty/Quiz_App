import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(
      () {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
        retakeQuiz: restartQuiz,
      );
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 58, 196),
            Color.fromRGBO(75, 33, 192, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: screenWidget,
      //activeScreen == 'start-screen'
      //     ? StartScreen(switchScreen)
      //     : QuestionsScreen(onSelectAnswer: chooseAnswer),
    );
  }
}
