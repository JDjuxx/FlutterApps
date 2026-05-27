import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.onTap, {super.key, required this.answerText});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            backgroundColor: Color(0xFFFAA754),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
