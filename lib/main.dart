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
    '/home': (context) => const HomeScreen(), 
    '/sign': (context) => const SignUpPage(), 
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Proyecto de Examen',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Cambia '/' por la ruta de tu pantalla de inicio de sesión
      routes: _routes,
    );
  }
}
