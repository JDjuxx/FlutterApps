import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/services/quiz_storage.dart';

final quizStorageServiceProvider = Provider<QuizStorageService>((ref) {
  return QuizStorageService();
});
