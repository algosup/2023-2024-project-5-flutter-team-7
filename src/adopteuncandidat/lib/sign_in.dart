import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override

  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _onSeekerPressed() {
    context.go('/SignInSeeker');
    print('Seeker button pressed');
  }

  void _onRecruiterPressed() {
    context.go('/SignInRecruiter');
    print('Recruiter button pressed');
  }

  void _handleSwipe(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      _onSeekerPressed();
    } else if (details.primaryVelocity! > 0) {
      _onRecruiterPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: _handleSwipe,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Qui êtes-vous ?',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70), // Adjusted to move down the icons
                        const Icon(Icons.person, size: 200), // Increased size of the icon
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _onSeekerPressed,
                          child: const Text('Je suis un chercheur d\'emploi'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 100,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70), // Adjusted to move down the icons
                        const Icon(Icons.business, size: 200), // Increased size of the icon
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _onRecruiterPressed,
                          child: const Text('Je suis un recruteur'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
