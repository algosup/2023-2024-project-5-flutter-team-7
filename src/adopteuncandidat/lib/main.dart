import 'package:flutter/material.dart';
import 'routes.dart';
import 'sign_in.dart';
import 'sign_in_seeker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Matchmaking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

class SignInLayout extends StatelessWidget {
  const SignInLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInScreen(),
      ),
    );
  }
}

class SignInSeekerLayout extends StatelessWidget {
  const SignInSeekerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInSeekerScreen(),
      ),
    );
  }
}


