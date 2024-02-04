import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(170, 253, 253, 253),
          ),
          const SizedBox(height: 60),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.josefinSans(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
            label: const Text(
              'start quiz',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
