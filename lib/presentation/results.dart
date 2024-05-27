import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  Future<Map<String, dynamic>> _loadResultsAndProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int correctAnswers = prefs.getInt('correctAnswers') ?? 0;
    int incorrectAnswers = prefs.getInt('incorrectAnswers') ?? 0;
    String name = prefs.getString('name') ?? 'N/A';
    String phone = prefs.getString('phone') ?? 'N/A';
    String email = prefs.getString('email') ?? 'N/A';
    String age = prefs.getString('age') ?? 'N/A';
    String gender = prefs.getString('gender') ?? 'N/A';

    return {
      'correctAnswers': correctAnswers,
      'incorrectAnswers': incorrectAnswers,
      'name': name,
      'phone': phone,
      'email': email,
      'age': age,
      'gender': gender,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultados',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF844b54),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 183, 155),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadResultsAndProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los resultados'));
          } else {
            int correctAnswers = snapshot.data!['correctAnswers']!;
            int incorrectAnswers = snapshot.data!['incorrectAnswers']!;
            String name = snapshot.data!['name'];
            String phone = snapshot.data!['phone'];
            String email = snapshot.data!['email'];
            String age = snapshot.data!['age'];
            String gender = snapshot.data!['gender'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resultados del Test',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF844b54),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nombre: $name',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Teléfono: $phone',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Correo Electrónico: $email',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Edad: $age',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Género: $gender',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Respuestas correctas: $correctAnswers',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Respuestas incorrectas: $incorrectAnswers',
                    style: const TextStyle(fontSize: 18, color: Color(0xFF844b54)),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
