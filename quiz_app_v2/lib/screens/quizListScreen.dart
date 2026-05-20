import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/data/questions.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/widgets/quiz_card.dart';

class QuizListScreen extends ConsumerStatefulWidget {
  const QuizListScreen({super.key});

  @override
  ConsumerState<QuizListScreen> createState() {
    return _QuizListScreenState();
  }
}

class _QuizListScreenState extends ConsumerState<QuizListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LISTA DE QUIZ'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: Column(
          children: [
            QuizCard(
              quiz: Quiz('QUIZ DE FLUTTER', questions),
            ),
          ],
        ));
  }
}
