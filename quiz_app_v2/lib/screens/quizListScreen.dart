import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/data/questions.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/providers/quiz_provider.dart';
//import 'package:quiz_app_v2/providers/quiz_storage_provider.dart';
import 'package:quiz_app_v2/widgets/quiz_card.dart';

class QuizListScreen extends ConsumerStatefulWidget {
  const QuizListScreen({super.key});

  @override
  ConsumerState<QuizListScreen> createState() {
    return _QuizListScreenState();
  }
}

class _QuizListScreenState extends ConsumerState<QuizListScreen> {
  //final List<Quiz> quizList = ref.read(quizProvider.notifier).loadQuizzes() as List<Quiz>;
  //List<Quiz> _quizList = [];

  // @override
  // void initState() {
  //   super.initState();

  //   Future.microtask(() {
  //     ref.read(quizProvider.notifier).loadQuizzes();
  //   });
  // }

  // Future<void> loadData() async {
  //   final quizzes = await ref.read(quizStorageServiceProvider).loadQuizes();
  //   setState(() {
  //     _quizList = quizzes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final quizListAsync = ref.watch(quizProvider);

    // Widget content = Center(
    //   child: Text(
    //     'No quizzes added yet',
    //     style: TextTheme.of(context).titleMedium,
    //   ),
    // );

    // if (quizList!.isNotEmpty) {
    //   content = ListView.builder(
    //     itemBuilder: (ctx, index) => QuizCard(
    //       quiz: quizList[index],
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('LISTA DE QUIZZES'),
        actions: [
          IconButton(
              onPressed: () async {
                await ref
                    .read(quizProvider.notifier)
                    .addQuiz(Quiz('QUIZ DE PRUEBA', questions));
                //_quizList.add(Quiz('QUIZ DE PRUEBA', questions));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: quizListAsync.when(data: (quizList) {
        print('QUIZZES IN UI: ${quizList.length}');
        if (quizList.isNotEmpty) {
          return ListView.builder(
            itemCount: quizList.length,
            itemBuilder: (ctx, index) => QuizCard(
              quiz: quizList[index],
            ),
          );
        }
        return Center(
          child: Text(
            'No quizzes added yet',
            style: TextTheme.of(context).titleMedium,
          ),
        );
      }, error: (error, stackTrace) {
        return Center(
          child: Text('Error: $error'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
