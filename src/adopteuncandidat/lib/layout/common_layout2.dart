import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class CommonLayout2 extends StatelessWidget {
  final Widget body;
  const CommonLayout2({required this.body, super.key});

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
            _buildDisabledIconButton(
              icon: Icons.person,
              onPressed: () {
                context.go('/jobSeekerProfile');
              },
            ),
            const Spacer(),
            _buildDisabledIconButton(
              icon: Icons.compare_arrows,
              onPressed: () {
                context.go('/matchmaking');
              },
            ),
            const Spacer(),
            _buildDisabledIconButton(
              icon: Icons.settings,
              onPressed: () {
                context.go('/settings');
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }

  Widget _buildIconButton({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30,
      alignment: Alignment.topLeft,
      color: Colors.black,
      onPressed: onPressed,
    );
  }

  Widget _buildDisabledIconButton({required IconData icon, required VoidCallback onPressed}) {
    return IgnorePointer(
      ignoring: true, // This makes the IconButton unclickable
      child: _buildIconButton(icon: icon, onPressed: onPressed),
    );
  }
}
