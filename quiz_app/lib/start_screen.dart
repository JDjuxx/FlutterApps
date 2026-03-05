import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 200,
        //   ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: Color.fromARGB(100, 255, 255, 255),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.deepOrangeAccent,
          ),
          label: Text('Start Quiz'),
          icon: Icon(
            Icons.arrow_right,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
