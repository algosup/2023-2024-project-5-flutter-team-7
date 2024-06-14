import 'package:adopteuncandidat/models/layout_model.dart';
import 'package:adopteuncandidat/widgets/app_bar_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CommonLayout extends StatelessWidget {
  final LayoutType type;
  final Widget body;
  const CommonLayout({required this.body, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    if (!type.showAppBar()) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.rotate(
              angle: pi,
              child: AppBarButton(
                icon: Icons.logout,
                route: '/',
                selected: type == LayoutType.login,
              ),
            ),
            AppBarButton(
              icon: Icons.person,
              route: '/jobSeekerProfile',
              selected: type == LayoutType.editProfile,
            ),
            AppBarButton(
              icon: Icons.compare_arrows,
              route: '/matchmaking',
              selected: type == LayoutType.matchmaking,
            ),
            AppBarButton(
              icon: Icons.settings,
              route: '/settings',
              selected: type == LayoutType.settings,
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
