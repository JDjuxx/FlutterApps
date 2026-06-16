import 'package:flutter/material.dart';
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
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CREA TU PROPIO QUIZ')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questionsBlocks.length,
                itemBuilder: (context, index) {
                  return QuestionBlock(question: questionsBlocks[index]);
                },
              ),
              //SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
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
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: const Color.fromARGB(255, 96, 231, 69),
                    ),
                    child: Icon(
                      Icons.save,
                      size: 26,
                      color: Color(0xFFFAA754),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
