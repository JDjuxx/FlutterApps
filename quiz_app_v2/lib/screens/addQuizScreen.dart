import 'package:flutter/material.dart';
import 'package:quiz_app_v2/models/question_input.dart';
import 'package:quiz_app_v2/models/quiz.dart';
import 'package:quiz_app_v2/models/quiz_question.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late List<QuestionInput> questionsBlocks;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    questionsBlocks = [
      QuestionInput(),
    ];
  }

  void addQuestionBlock() {
    setState(() {
      questionsBlocks.add(QuestionInput());
    });
  }

  void removeQuestionBlock(int index) {
    setState(() {
      questionsBlocks[index].dispose();
      questionsBlocks.removeAt(index);
    });
  }

  void saveFrom() {
    final bool isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) {
      return;
    }

    List<QuizQuestion> quizQuestions = questionsBlocks.map((input) {
      return QuizQuestion(
        input.questionController.text.trim(),
        [
          input.correctAnswerController.text.trim(),
          input.option2Controller.text.trim(),
          input.option3Controller.text.trim(),
          input.option4Controller.text.trim(),
        ],
      );
    }).toList();

    Quiz newQuiz = Quiz(titleController.text.trim(), quizQuestions);

    Navigator.pop<Quiz>(context, newQuiz);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CREA TU PROPIO QUIZ')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                          hintText: 'Ejemplo: Preguntas de historia',
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingresa un título';
                          }

                          if (value.trim().length < 3) {
                            return 'El título debe tener al menos 3 caracteres';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: descriptionController,
                        minLines: 5,
                        maxLines: 8,
                        maxLength: 500,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                          hintText:
                              'Escribe una descripción del cuestionario...',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingresa una descripción';
                          }

                          if (value.trim().length < 10) {
                            return 'La descripción debe tener al menos 10 caracteres';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionsBlocks.length,
                  itemBuilder: (context, index) => Dismissible(
                    key: ValueKey(questionsBlocks[index]),
                    background: Container(
                      color: Colors.redAccent,
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        //vertical: Theme.of(context).cardTheme.margin!.vertical,
                        vertical: 8,
                      ),
                    ),
                    child: QuestionBlock(
                      question: questionsBlocks[index],
                    ),
                    onDismissed: (direction) {
                      removeQuestionBlock(index);
                    },
                  ),
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
                      onPressed: saveFrom,
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
      ),
    );
  }
}
