import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'main.dart';



final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const MatchmakingLayout();
      },
    ),
    GoRoute(
      name: 'matchmakingDone',
      path: '/matchmakingDone',
      builder: (BuildContext context, GoRouterState state) {
        return const MatchMakingDoneLayout();
      },
    ),
  ],
);
