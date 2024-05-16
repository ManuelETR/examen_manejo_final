import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const Icon(Icons.logout),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Examen de Manejo',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            // Aquí puedes agregar la lógica para navegar a la pantalla de perfil
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
          ElevatedButton.icon(
            onPressed: () {
              // Aquí puedes agregar la lógica para iniciar el test
            },
            icon: const Icon(Icons.assignment_rounded),
            label: const Text('Hacer el Test'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Aquí puedes agregar la lógica para ver los resultados previos
            },
            icon: const Icon(Icons.history_rounded),
            label: const Text('Ver Resultados Previos'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Aquí puedes agregar la lógica para la opción adicional
            },
            icon: const Icon(Icons.lightbulb_rounded),
            label: const Text('Consejos y Recomendaciones'),
          ),
        ],
      ),
    );
  }

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
