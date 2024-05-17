import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      questionText: "En cual de estas dos calles se puede realizar un rebase?",
      options: ["Izquierda", "Derecha"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "¿Es correcto para este automóvil estacionarse en esta banqueta roja?",
      options: [
        "Únicamente si es por tiempo limitado",
        "Siempre y cuando sea una emergencia",
        "Está prohibido"
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: "El artículo 75 refiere En los cruceros se restringe la circulación cuando:",
      options: [
        "No haya espacio libre en la cuadra siguiente para que los vehículos avancen",
        "Cuando el artista urbano no haya terminado su show",
        "Cuando no haya alguna manera de evitar baches en el crucero"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "¿Al dar vuelta a la izquierda en los cruceros el conductor puede escoger libremente el carril que le convenga?",
      options: [
        "Sí, siempre que esté libre el carril y utilice sus intermitentes.",
        "Solamente el carril de extremo izquierdo junto al camellón o raya central"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "En las glorietas, donde la circulación no esté controlada por semáforos, ¿Quien tiene prioridad?",
      options: [
        "Los conductores que ya se encuentren circulando en ella",
        "Los conductores que se van incorporando"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "¿Le es permitido a este operador detenerse en doble fila?",
      options: [
        "Está prohibido estacionarse",
        "Solamente si va a subir/bajar pasaje",
        "Solamente si es un área delimitada para transporte público"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "¿Está permitido rebasar desde el carril derecho?",
      options: [
        "No, únicamente se puede rebasar desde la izquierda y en la imagen hay línea continua por la derecha",
        "Si está permitido en vías de dos o más carriles de circulación en el mismo sentido, cuando el carril de la derecha permite circular con mayor rapidez."
      ],
      correctAnswerIndex: 1,
    ),
  ];

  final Map<int, int> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen de Manejo'),
        backgroundColor: const Color(0xFFac6c34),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: _questions
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
          color: Colors.red,
          margin: const EdgeInsets.only(bottom: 8.0),
          child: const Center(child: Text('Imagen')),
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

  void _submitQuiz() {
    int correctAnswers = 0;
    _answers.forEach((questionIndex, answerIndex) {
      if (answerIndex == _questions[questionIndex].correctAnswerIndex) {
        correctAnswers++;
      }
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultados'),
          content: Text('Has respondido correctamente $correctAnswers de ${_questions.length} preguntas.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
