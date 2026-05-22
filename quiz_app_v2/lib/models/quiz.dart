import 'package:quiz_app_v2/models/quiz_question.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Quiz {
  Quiz(this.title, this.questions) : id = uuid.v4();

  final List<QuizQuestion> questions;
  final String title;
  final String id;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      json['title'],
      (json['questions'] as List<dynamic>? ?? [])
          .map((q) => QuizQuestion.fromJson(q))
          .toList(),
    );
  }
}
