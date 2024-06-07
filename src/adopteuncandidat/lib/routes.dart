import 'matchmaking.dart';
import 'matchmaking_done.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'soft_skills_selection_seeker.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    name: 'signIn',
    path: '/signIn',
    builder: (BuildContext context, GoRouterState state) {
      return const SignInLayout();
    },
  ),
  GoRoute(
    name: 'home',
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const StartLayout();
    },
  ),
  GoRoute(
    name: 'signInSeeker',
    path: '/signInSeeker',
    builder: (BuildContext context, GoRouterState state) {
      return const SignInSeekerLayout();
    },
  ),
  GoRoute(
    name: 'matchmaking',
    path: '/matchmaking',
    builder: (BuildContext context, GoRouterState state) {
      return const MatchmakingScreen();
    },
  ),
  GoRoute(
    name: 'matchmakingDone',
    path: '/matchmakingDone',
    builder: (BuildContext context, GoRouterState state) {
      return const MatchmakingDoneScreen();
    },
  ),
  GoRoute(
    name: 'login',
    path: '/login',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginLayout();
    },
  ),
  GoRoute(
    name: 'softSkillsSeeker',
    path: '/softSkillsSeeker',
    builder: (BuildContext context, GoRouterState state) {
      return const SoftSkillsSelectionScreen(isEditMode: false);
    },
  ),
  GoRoute(
    name: 'hobbies',
    path: '/hobbies',
    builder: (BuildContext context, GoRouterState state) {
      return const HobbiesSelectionLayout();
    },
  ),
  GoRoute(
    name: 'jobSeekerProfile',
    path: '/jobSeekerProfile',
    builder: (BuildContext context, GoRouterState state) {
      return const JobSeekerLayout();
    },
  ),

GoRoute(
  path: '/editSoftSkillsSeeker',
  builder: (BuildContext context, GoRouterState state) {
    return const SoftSkillsSelectionScreen(isEditMode: true);
  },
),

]);
