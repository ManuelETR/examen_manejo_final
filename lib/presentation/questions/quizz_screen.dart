import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:examen_manejo/widgets/generales/questions.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<int, int> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Examen de Manejo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF844b54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: questions
                .asMap()
                .entries
                .map((entry) {
                  int questionIndex = entry.key;
                  Question question = entry.value;
                  return _buildQuestion(questionIndex, question);
                })
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitQuiz,
        tooltip: 'Enviar',
        backgroundColor: const Color(0xFF844b54),
        foregroundColor: Colors.white,
        child: const Icon(Icons.send),
      ),
    );
  }

  Widget _buildQuestion(int index, Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Image.asset(
            question.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "${index + 1}. ${question.questionText}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: question.options.asMap().entries.map((entry) {
            int optionIndex = entry.key;
            String optionText = entry.value;
            return RadioListTile<int>(
              title: Text(optionText),
              value: optionIndex,
              groupValue: _answers[index],
              onChanged: (value) {
                setState(() {
                  _answers[index] = value!;
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _submitQuiz() async {
    int correctAnswers = 0;
    int incorrectAnswers = 0;

    _answers.forEach((questionIndex, answerIndex) {
      if (answerIndex == questions[questionIndex].correctAnswerIndex) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
    });

    // Guardar resultados en SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('correctAnswers', correctAnswers);
    await prefs.setInt('incorrectAnswers', incorrectAnswers);

    // Mostrar diálogo de confirmación
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test contestado exitosamente'),
          content: const Text('Los resultados se han guardado.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
