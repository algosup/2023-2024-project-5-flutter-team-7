import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';
import 'matchmaking.dart';
import 'matchmaking_done.dart';


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


class MatchmakingLayout extends StatelessWidget {
  const MatchmakingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            IconButton(
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
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/profile');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.compare_arrows),
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/matchmaking');
              },
            ),
            const Spacer(), 
            IconButton(
              alignment: Alignment.topLeft,
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
        child: Center(
          child: MatchmakingScreen(),
        ),
      ),
    );
  }
}

class MatchMakingDoneLayout extends StatelessWidget {
  const MatchMakingDoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            IconButton(
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
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/profile');
              },
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.compare_arrows),
              alignment: Alignment.topLeft,
              color: Colors.black,
              onPressed: () {
                context.go('/matchmaking');
              },
            ),
            const Spacer(), 
            IconButton(
              alignment: Alignment.topLeft,
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
        child: MatchmakingDoneScreen(),
      ),
    );
  }
}

