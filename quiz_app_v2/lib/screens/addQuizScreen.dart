import 'package:flutter/material.dart';
import 'package:quiz_app_v2/data/questions.dart';
import 'package:quiz_app_v2/models/question_input.dart';
import 'package:quiz_app_v2/widgets/question_block.dart';

class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({super.key});

  @override
  State<AddQuizScreen> createState() {
    return _AddQuizScreenState();
  }
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  final _formKey = GlobalKey<FormState>();
  late List<QuestionInput> questionsBlocks;

  void addQuestionBlock() {
    setState(() {
      questionsBlocks.add(QuestionInput());
    });
  }

  @override
  void initState() {
    questionsBlocks = [
      QuestionInput(),
    ];
  }

  void removeQuestionBlock(int index) {
    setState(() {
      questionsBlocks[index].dispose();
      questionsBlocks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Agrega una o más preguntas a tu QUIZ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: questionsBlocks.length,
              itemBuilder: (context, index) {
                return QuestionBlock(question: questionsBlocks[index]);
              },
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: ElevatedButton(
                onPressed: addQuestionBlock,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
