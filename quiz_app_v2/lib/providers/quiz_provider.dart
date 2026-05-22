import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/providers/quiz_storage_provider.dart';

final quizProvider =
    AsyncNotifierProvider<QuizNotifier, List<Quiz>>(QuizNotifier.new);

class QuizNotifier extends AsyncNotifier<List<Quiz>> {
  late final _storageService = ref.read(quizStorageServiceProvider);

  @override
  FutureOr<List<Quiz>> build() async {
    return await _storageService.loadQuizes();
  }

  Future<void> loadQuizzes() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _storageService.loadQuizes();
    });
  }

  Future<void> addQuiz(Quiz quiz) async {
    final currentQuizzes = state.value ?? [];

    final updateQuizzes = [...currentQuizzes, quiz];

    state = AsyncData(updateQuizzes);
    await _storageService.saveQuizzes(updateQuizzes);
  }

  Future<void> deleteQuiz(String id) async {
    final currentQuizzes = state.value ?? [];

    final updateQuizzes =
        currentQuizzes.where((quiz) => quiz.id != id).toList();

    state = AsyncData(updateQuizzes);
    await _storageService.saveQuizzes(updateQuizzes);
  }

  Future<void> updateQuiz(Quiz updatedQuiz) async {
    final currentQuizzes = state.value ?? [];

    final updatedQuizzes = currentQuizzes.map((quiz) {
      if (quiz.id == updatedQuiz.id) {
        return updatedQuiz;
      }
      return quiz;
    }).toList();

    state = AsyncData(updatedQuizzes);

    await _storageService.saveQuizzes(updatedQuizzes);
  }
}
