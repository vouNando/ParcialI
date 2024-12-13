import 'package:app002_prueba/navegadores/drawer.dart';
import 'package:app002_prueba/screens/screens1.dart';
import 'package:app002_prueba/screens/screens2.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Asegúrate de que esta línea esté incluida

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido a vouBanc"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: const MiDrawer(), // Aquí se agrega el Drawer personalizado
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/736x/f8/e8/1c/f8e81c5fdf0de31906d9ffb9eb005ed0.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "vouBanc",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "¡Gestiona tus finanzas de manera segura y fácil!",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '"Confianza y respaldo en cada operación"',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: bankLogo(),
                ),
                const SizedBox(height: 20),
                loginButton(context),
                const SizedBox(height: 10),
                registerButton(context),
                const Spacer(),
                footer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget loginButton(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => navigateToLogin(context),
    label: const Text(
      "Iniciar Sesión",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.login_outlined, size: 20),
  );
}

Widget registerButton(BuildContext context) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () => navigateToRegister(context),
    label: const Text(
      "Registrarse",
      style: TextStyle(fontSize: 18),
    ),
    icon: const Icon(Icons.app_registration_rounded, size: 20),
  );
}

void navigateToLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Screen2()),
  );
}

void navigateToRegister(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Screens1()),
  );
}

Widget bankLogo() {
  return Image.network(
    "https://cdn-icons-png.flaticon.com/128/13451/13451131.png",
    width: 300,
    height: 300,
  );
}

Widget footer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Desarrollado por:",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Nombre: Fernando Andrango",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "GitHub: vouNando",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla API"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          "Aquí va la información relacionada con la API.",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
