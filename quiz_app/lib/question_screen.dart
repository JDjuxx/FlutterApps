import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  var currentIndexCuestion = 0;

  void answerQuestion(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndexCuestion ++;  
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndexCuestion];
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 31,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton((){
              answerQuestion(answer);
            }, answerText: answer);
          }),
        ],
      ),
    );
  }
}
