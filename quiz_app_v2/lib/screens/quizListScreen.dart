import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ),
      body: Text('Lista de quizeses'),
    );
  }
}
