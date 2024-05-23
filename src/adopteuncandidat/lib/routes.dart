import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'main.dart';



final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginLayout();
      },
    ),
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInLayout();
      },
    ),
    GoRoute(
      name: 'signInSeeker',
      path: '/signInSeeker',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInSeekerLayout();
      },
    ),
  ],
);
