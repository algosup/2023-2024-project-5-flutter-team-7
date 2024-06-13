import 'package:adopteuncandidat/widgets/back_button.dart';
import 'package:adopteuncandidat/widgets/sign_in/background.dart';
import 'package:adopteuncandidat/widgets/sign_in/footer.dart';
import 'package:adopteuncandidat/widgets/sign_in/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _handleSwipe(DragEndDetails details) {
    const threshold = 300;
    if (details.primaryVelocity! > threshold) {
      context.go('/SignInSeeker');
    } else if (details.primaryVelocity! < -threshold) {
      context.go('/SignInRecruiter');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoBackButton(
          location: '/',
          content: GestureDetector(
            onHorizontalDragEnd: _handleSwipe,
            child: const SignInBackground(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SignInHeader(),
                    SignInFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
