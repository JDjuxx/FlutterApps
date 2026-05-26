import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:quiz_app_v2/models/quiz.dart';

class QuizStorageService {
  static const String _fileName = 'quizzes.json';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print('QUIZZES FILE PATH: ${directory.path}/$_fileName');
    return File('${directory.path}/$_fileName');
  }

  Future<List<Quiz>> loadQuizes() async {
    try {
      final file = await _getFile();

      if (!await file.exists()) {
        await file.writeAsString(jsonEncode([]));
        return [];
      }

      final content = await file.readAsString();
      print('CONTENT: $content');

      if (content.isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = jsonDecode(content);

      return jsonList.map((item) => Quiz.fromJson(item)).toList();
    } catch (e) {
      print('Error loading quizzes: $e');
      return [];
    }
  }

  Future<void> saveQuizzes(List<Quiz> quizzes) async {
    try {
      final file = await _getFile();

      final jsonList = quizzes.map((quiz) => quiz.toJson()).toList();

      await file.writeAsString(jsonEncode(jsonList));
    } catch (e) {
      print('Error saving quizzes: $e');
    }
  }
}
