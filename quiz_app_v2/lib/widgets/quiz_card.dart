import 'package:flutter/material.dart';
import 'package:quiz_app_v2/models/quiz.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(quiz.title),
                Spacer(),
                Text('Preguntas: ${quiz.questions.length.toString()}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
