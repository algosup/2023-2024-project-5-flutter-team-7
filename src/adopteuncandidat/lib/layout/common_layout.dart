import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class CommonLayout extends StatelessWidget {
  final Widget body;
  const CommonLayout({required this.body, super.key});

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
                context.go('/jobSeekerProfile');
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
      body: SafeArea(
        child: body,
      ),
    );
  }
}
