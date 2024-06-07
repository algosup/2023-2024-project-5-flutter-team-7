import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override

  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void _onSignupPressed() {
    GoRouter.of(context).go('/SignIn');
    print('Signup button pressed');
  }

  void _onLoginPressed(BuildContext context) {
    GoRouter.of(context).go('/login');
    print('Login button pressed');
  }

  ButtonStyle _buttonStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFB3B2), Color(0xFFFF3632)],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: _onSignupPressed,
                    style: _buttonStyle(Colors.white),
                    child: const Text('s\'inscrire'),
                  ),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () => _onLoginPressed(context),
                    style: _buttonStyle(Colors.white),
                    child: const Text('Se connecter'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 120,
            right: 0,
            bottom: 90,
            child: Image.asset('assets/logo.png'), // Adjust the path according to your asset folder structure
          ),
        ],
      ),
    );
  }
}
