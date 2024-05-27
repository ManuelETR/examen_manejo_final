import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Asegúrate de importar tus opciones de Firebase
import 'package:examen_manejo/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // Define tus rutas aquí
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const LoginPage(),
    '/sign': (context) => const SignUpPage(), 
    '/home': (context) => const HomeScreen(), 
    '/quizz': (context) => QuizScreen(),
    '/results': (context) => const ResultsScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/guide': (context) => const GuideScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto de Examen',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Cambia '/' por la ruta de tu pantalla de inicio de sesión
      routes: _routes,
    );
  }
}
