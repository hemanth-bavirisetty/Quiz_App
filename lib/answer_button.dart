import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.ontap,
  });

  final String answerText;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 54, 4, 95),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(20)),
        onPressed: ontap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}