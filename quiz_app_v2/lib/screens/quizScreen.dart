import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/screens/ResultScreen.dart';
import 'package:quiz_app_v2/widgets/answer_button.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key, required this.quiz});
  final Quiz quiz;

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  var currentIndex = 0;
  List<String> selectedAnswers = [];

  void answerQuestion(String answer) {
    setState(() {
      currentIndex++;
      selectedAnswers.add(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (selectedAnswers.length != widget.quiz.questions.length) {
      final currentQuestion = widget.quiz.questions[currentIndex];
      content = Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 31,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return AnswerButton(() {
                answerQuestion(answer);
              }, answerText: answer);
            }),
          ],
        ),
      );
    } else {
      content = Resultscreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: content,
    );
  }
}
