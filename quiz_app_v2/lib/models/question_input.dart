import 'package:flutter/widgets.dart';

class QuestionInput {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();

  void dispose() {
    questionController.dispose();
    correctAnswerController.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
  }
}
