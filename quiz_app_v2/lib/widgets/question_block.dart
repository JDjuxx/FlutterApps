import 'package:flutter/material.dart';
import 'package:quiz_app_v2/models/question_input.dart';

class QuestionBlock extends StatefulWidget {
  const QuestionBlock({super.key, required this.question});
  final QuestionInput question;

  @override
  State<QuestionBlock> createState() => _QuestionBlockState();
}

class _QuestionBlockState extends State<QuestionBlock> {
  late bool optionShowed;

  @override
  void initState() {
    super.initState();
    optionShowed = true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> options = [
      SizedBox(height: 16),
      _buildTextField(
          controller: widget.question.correctAnswerController,
          label: 'Opcion correcta',
          hint: '',
          icon: Icons.check_circle,
          color: Colors.green),
      SizedBox(height: 5),
      Row(
        children: const [
          Text(
            'Ingrese la opción correcta en este campo. OBLIGATORIO',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.info_outline,
            size: 14,
            color: Colors.grey,
          ),
        ],
      ),
      SizedBox(height: 16),
      _buildTextField(
          controller: widget.question.option2Controller,
          label: 'Opcion incorrecta',
          hint: '',
          icon: Icons.close_outlined,
          color: Colors.red),
      SizedBox(height: 16),
      _buildTextField(
          controller: widget.question.option3Controller,
          label: 'Opcion incorrecta',
          hint: '',
          icon: Icons.close,
          color: Colors.red),
      SizedBox(height: 16),
      _buildTextField(
          controller: widget.question.option4Controller,
          label: 'Opcion incorrecta',
          hint: '',
          icon: Icons.close,
          color: Colors.red),
    ];

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: _buildTextField(
                    controller: widget.question.questionController,
                    label: 'Pregunta',
                    hint: '¿Cual es el objetivo de la programación?',
                    icon: Icons.question_mark,
                    color: Colors.black),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      optionShowed = !optionShowed;
                    });
                  },
                  icon: Icon(optionShowed
                      ? Icons.arrow_downward
                      : Icons.arrow_upward)),
            ]),
            ...(optionShowed ? options : []),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required Color color,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
    );
  }
}
