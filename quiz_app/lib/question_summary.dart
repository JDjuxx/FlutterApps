import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget{
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: summaryData.map((data){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: data['user_answer'] == data['correct_answer'] ? Colors.amber : Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(((data['question_index'] as int) + 1).toString()),),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'].toString(), style: GoogleFonts.lato(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(data['user_answer'] as String, style: GoogleFonts.dangrek(color: data['user_answer'] == data['correct_answer'] ? Colors.greenAccent : const Color.fromARGB(255, 95, 30, 26), fontSize: 15,),),
                        Text(data['correct_answer'].toString(), style: GoogleFonts.dangrek(color: Colors.green, fontSize: 15,),),
                        SizedBox(height: 5,),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}