import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/providers/quiz_provider.dart';
import 'package:quiz_app_v2/providers/quiz_storage_provider.dart';

class QuizCard extends ConsumerWidget {
  const QuizCard({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void deleteQuiz(String id) {
      ref.watch(quizProvider.notifier).deleteQuiz(id);
    }

    return Card(
      color: Colors.grey.shade100,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(quiz.title),
                          Spacer(),
                          Text('Preguntas: ${quiz.questions.length.toString()}')
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    deleteQuiz(quiz.id);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
