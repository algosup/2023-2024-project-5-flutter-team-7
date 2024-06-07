import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'provider_soft_skills_seeker.dart';

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
      return const SoftSkillsSelectionLayout();
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
  // GoRoute(
  //   name: 'editProfile',
  //   path: '/editProfile',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const EditProfileLayout();
  //   },
  // ),
GoRoute(
  path: '/editSoftSkillsSeeker',
  builder: (BuildContext context, GoRouterState state) {
    final selectedSkills = state.pathParameters['selectedSkills'];
    return ChangeNotifierProvider(
      create: (_) => SoftSkillsProvider(),
      child: EditSoftSkillsSeekerLayout(selectedSoftSkills: selectedSkills),
    );
  },
),
  // GoRoute(
  //   name: 'editHobbies',
  //   path: '/editHobbies',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const EditHobbiesLayout();
  //   },
  // ),
  // GoRoute(
  //   name: 'viewMatches',
  //   path: '/viewMatches',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const ViewMatchesLayout();
  //   },
  // ),
  // GoRoute(
  //   name: 'deleteAccount',
  //   path: '/deleteAccount',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const DeleteAccountLayout();
  //   },
  // ),
  // GoRoute(
  //   name: 'reviewFriend',
  //   path: '/reviewFriend',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return const ReviewFriendLayout();
  //   },
  // ),
]);
