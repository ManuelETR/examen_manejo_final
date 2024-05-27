import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 183, 155), // Color de fondo de la pantalla
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _buildAppBar(context),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showLogoutDialog(context);
        },
        tooltip: 'Cerrar Sesión',
        backgroundColor: const Color(0xFF844b54),
        foregroundColor: Colors.white, // Color del icono
        child: const Icon(Icons.logout), // Icono de cierre de sesión
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Evita que se genere una flecha automática de regreso
      backgroundColor: const Color(0xFF844b54),
      title: const Text(
        'Examen de Manejo',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white, size: 35),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildElevatedButton(
            context,
            onPressed: () {
              // Aquí puedes agregar la lógica para iniciar el test
              Navigator.pushReplacementNamed(context, '/quizz');
            },
            icon: const Icon(Icons.assignment_rounded, size: 35),
            label: 'Hacer el Test',
          ),
          const SizedBox(height: 95), // Separación aumentada
          _buildElevatedButton(
            context,
            onPressed: () {
              // Aquí puedes agregar la lógica para ver los resultados previos
              Navigator.pushReplacementNamed(context, '/results');
            },
            icon: const Icon(Icons.history_rounded, size: 35),
            label: 'Ver Resultados',
          ),
          const SizedBox(height: 95), // Separación aumentada
          _buildElevatedButton(
            context,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/guide');
            },
            icon: const Icon(Icons.lightbulb_rounded, size: 35),
            label: 'Información',
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context,
      {required VoidCallback onPressed, required Icon icon, required String label}) {
    return SizedBox(
      width: 250, // Ancho del botón aumentado
      height: 80, // Alto del botón aumentado
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: IconTheme(
          data: const IconThemeData(color: Colors.white), // Color del icono
          child: icon,
        ),
        label: Text(
          label,
          style: const TextStyle(
            inherit: true, // Asegura que el estilo de texto herede propiedades
            color: Colors.white, // Color del texto
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF844b54), // Color del botón
        ),
      ),
    );
  }
//backgroundColor: const Color(0xFF844b54),
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cerrar Sesión'),
          content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cerrar el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true); // Cerrar el diálogo y confirmar la acción

                // Cerrar sesión con Firebase Auth
                await FirebaseAuth.instance.signOut();

                // Cerrar sesión con Google si el usuario inició sesión con Google
                final GoogleSignIn googleSignIn = GoogleSignIn();
                if (await googleSignIn.isSignedIn()) {
                  await googleSignIn.signOut();
                }

                // Redirigir a la pantalla de inicio de sesión
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Cerrar Sesión'),
            ),
          ],
        );
      },
    );
  }
}

