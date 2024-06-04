import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'main.dart';



final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SoftSkillsSelectionLayout();
      },
    ),
    GoRoute(
      name: 'hobbies',
      path: '/hobbies',
      builder: (BuildContext context, GoRouterState state) {
        return const HobbiesSelectionLayout();
      },
    )
  ]
);
