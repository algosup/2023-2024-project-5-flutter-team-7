import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';
import 'layout/common_layout.dart';
import 'login.dart';
import 'start.dart';
import 'sign_in.dart';
import 'sign_in_seeker.dart';
import 'matchmaking.dart';
import 'matchmaking_done.dart';
import 'soft_skills_selection_seeker.dart';
import 'hobbies_selection.dart';
import 'job_seeker_profile.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Matchmaking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginScreen(),
      ),
    );
  }
}

class StartLayout extends StatelessWidget {
  const StartLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StartScreen(),
      ),
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





class HobbiesSelectionLayout extends StatelessWidget {
  const HobbiesSelectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: HobbiesSelectionScreen(),
    );
  }
}

class JobSeekerLayout extends StatelessWidget {
  const JobSeekerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: JobSeekerScreen(),
    );
  }
}


