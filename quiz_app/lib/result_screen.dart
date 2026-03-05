import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen(this.choosenAnswers, {super.key, required this.onRestartQuiz});
  final List<String> choosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    
    for(var i = 0; i < choosenAnswers.length ; i++){
      summary.add({
        'question_index' : i,
        'question': questions[i].question,
        'user_answer' : choosenAnswers[i],
        'correct_answer' : questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final correctQuestions = getSummaryData().where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number of correct Answers: $correctQuestions/${questions.length}', style: GoogleFonts.aclonica(color: const Color.fromARGB(187, 234, 228, 228),fontSize: 27,fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            QuestionSummary(summaryData: getSummaryData()),
            SizedBox(height: 20,),
            TextButton(onPressed: onRestartQuiz, child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.restore,size: 34,),SizedBox(width: 4,) ,Text('Restart Quiz',style: TextStyle(fontSize: 20),),],), ),
          ],
        ),
      ),
    );
  }
}