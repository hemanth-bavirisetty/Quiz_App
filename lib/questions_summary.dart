import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: summaryData.map(
            (data) {
              var indexColor = const Color.fromARGB(255, 249, 133, 241);
              if (data['user_answer'] == data['correct_answer']) {
                indexColor = const Color.fromARGB(255, 150, 198, 241);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: indexColor,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 22, 2, 56),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'].toString(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          data['correct_answer'].toString(),
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
