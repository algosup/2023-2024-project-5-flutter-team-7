import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/provider_personal_information.dart';
import 'providers/provider_hobbies_selection.dart';
import 'providers/provider_soft_skills_seeker.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  void _onSignupPressed() {
    GoRouter.of(context).go('/SignIn');
    ref.read(personalInformationProvider.notifier).reset();
    ref.read(hobbiesProvider.notifier).reset();
    ref.read(softSkillsProvider.notifier).reset();
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
                  SizedBox(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _onSignupPressed,
                      style: _buttonStyle(Colors.white),
                      child: const Text('s\'inscrire'),
                    ),
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => _onLoginPressed(context),
                      style: _buttonStyle(Colors.white),
                      child: const Text('Se connecter'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 120,
            right: 0,
            bottom: 90,
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
    );
  }
}
