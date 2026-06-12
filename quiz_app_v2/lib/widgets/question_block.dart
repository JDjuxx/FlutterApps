import 'package:flutter/material.dart';
import 'package:quiz_app_v2/models/question_input.dart';

class QuestionBlock extends StatelessWidget {
  const QuestionBlock({super.key, required this.question});
  final QuestionInput question;

  @override
  Widget build(BuildContext context) {
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
            _buildTextField(
                controller: question.questionController,
                label: 'Pregunta',
                hint: '¿Cual es el objetivo de la programación?',
                icon: Icons.question_mark),
            SizedBox(height: 16),
            _buildTextField(
                controller: question.correctAnswerController,
                label: 'Opcion A',
                hint: '',
                icon: Icons.circle),
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
                controller: question.option2Controller,
                label: 'Opcion B',
                hint: '',
                icon: Icons.circle),
            SizedBox(height: 16),
            _buildTextField(
                controller: question.option3Controller,
                label: 'Opcion C',
                hint: '',
                icon: Icons.circle),
            SizedBox(height: 16),
            _buildTextField(
                controller: question.option4Controller,
                label: 'Opcion D',
                hint: '',
                icon: Icons.circle),
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
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
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
