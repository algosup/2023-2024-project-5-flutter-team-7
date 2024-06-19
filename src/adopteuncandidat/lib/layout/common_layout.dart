import 'package:adopteuncandidat/models/layout_model.dart';
import 'package:adopteuncandidat/widgets/app_bar_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CommonLayout extends StatelessWidget {
  final LayoutModel model;
  final Widget body;

  const CommonLayout({super.key, required this.body, required this.model});

  @override
  Widget build(BuildContext context) {
    if (!model.layoutType.showAppBar()) {
      return Scaffold(
        body: SafeArea(
          child: body,
        ),
      );
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
                selected: model.layoutType == LayoutType.login &&
                    (model.userType == UserType.jobSeeker ||
                        model.userType == UserType.company),
              ),
            ),
            AppBarButton(
              icon: Icons.person,
              route: model.userType == UserType.jobSeeker
                  ? '/jobSeekerProfile'
                  : '/recruiterProfile',
              selected: model.layoutType == LayoutType.editProfile,
            ),
            AppBarButton(
              icon: Icons.compare_arrows,
              route: model.userType == UserType.jobSeeker
                  ? '/matchmaking'
                  : '/matchmakingCompany',
              selected: model.layoutType == LayoutType.matchmaking &&
                  model.userType == UserType.jobSeeker,
            ),
            AppBarButton(
              icon: Icons.settings,
              route: model.userType == UserType.jobSeeker
                  ? '/settings'
                  : '/settingsCompany',
              selected: model.layoutType == LayoutType.settings,
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
