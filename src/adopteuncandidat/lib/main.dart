
import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:go_router/go_router.dart';
import 'soft_skills_selection.dart';
import 'hobbies_selection.dart';
import 'dart:math';




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

class SoftSkillsSelectionLayout extends StatelessWidget {
  const SoftSkillsSelectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              color: Colors.black,
              alignment: Alignment.topLeft,
              icon: Transform.rotate(
                angle: pi,
                child: const Icon(Icons.login),
              ),
              onPressed: () {
                context.go('/');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.person),
              iconSize: 30,
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/profile');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.compare_arrows),
              iconSize: 30,
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/matchmaking');
              },
            ),
            const Spacer(), 
            IconButton(
              alignment: Alignment.topLeft,
              iconSize: 30,
              color: Colors.black,
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: SoftSkillsSelectionScreen(),

      ),
    );
  }
}

class HobbiesSelectionLayout extends StatelessWidget {
  const HobbiesSelectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              color: Colors.black,
              alignment: Alignment.topLeft,
              icon: Transform.rotate(
                angle: pi,
                child: const Icon(Icons.login),
              ),
              onPressed: () {
                context.go('/');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.person),
              iconSize: 30,
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/profile');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.compare_arrows),
              iconSize: 30,
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/matchmaking');
              },
            ),
            const Spacer(), 
            IconButton(
              alignment: Alignment.topLeft,
              iconSize: 30,
              color: Colors.black,
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: HobbiesSelectionScreen(),

      ),
    );
  }
}

