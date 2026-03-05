import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen (){
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer,);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultScreen(selectedAnswers, onRestartQuiz: restartQuiz,);       
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer,);
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown, Colors.deepOrange],
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
