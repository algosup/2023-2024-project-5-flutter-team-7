import 'package:adopteuncandidat/matchmaking_model.dart';

import 'hobbies_selection.dart';
import 'job_seeker_profile.dart';
import 'login.dart';
import 'sign_in.dart';
import 'sign_in_seeker.dart';
import 'start.dart';
import 'soft_skills_selection_seeker.dart';
import 'matchmaking_company.dart';
import 'matchmaking_done.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    name: 'signIn',
    path: '/signIn',
    builder: (BuildContext context, GoRouterState state) {
      return const SignInScreen();
    },
  ),
  GoRoute(
    name: 'home',
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const StartScreen();
    },
  ),
  GoRoute(
    name: 'signInSeeker',
    path: '/signInSeeker',
    builder: (BuildContext context, GoRouterState state) {
      return const PersonalInformationScreen(isEditMode: false,);
    },
  ),
  GoRoute(
    name: 'editProfileSeeker',
    path: '/editProfileSeeker',
    builder: (BuildContext context, GoRouterState state) {
      return const PersonalInformationScreen(isEditMode: true,);
    },
  ),
  GoRoute(
    name: 'matchmaking',
    path: '/matchmaking',
    builder: (BuildContext context, GoRouterState state) {
      const model = CompanyMatchmakingModel(
        name: "McDonald",
        location: "Châteauroux",
        softskills: [
          "Soft skills 1",
          "Soft skills 2",
          "Soft skills 3",
          "Soft skills 4",
          "Soft skills 5",
          "Soft skills 6",
          "Soft skills 7",
          "Soft skills 8",
        ],
        logoUrl:
            "https://eu-images.contentstack.com/v3/assets/blt5004e64d3579c43f/blt6243759afdfd4588/61e5b45c35e87a3ac8bc4840/Logo_France_Mcdo.png",
        backgroundUrl:
            "https://eu-images.contentstack.com/v3/assets/blt5004e64d3579c43f/bltca0f62bf135e82ae/61dc1ca53986d35c7f06f31b/Restaurant_McDo_Nimes_03.2028_3.jpg?auto=webp",
        backgroundColor: null,
      );
      return const CompanyMatchmakingScreen(model: model);
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
      return const LoginScreen();
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
      return const HobbiesSelectionScreen(isEditMode: false,);
    },
  ),

  GoRoute(
    name: 'editHobbies',
    path: '/editHobbies',
    builder: (BuildContext context, GoRouterState state) {
      return const HobbiesSelectionScreen(isEditMode: true);
    },
  ),
  GoRoute(
    name: 'jobSeekerProfile',
    path: '/jobSeekerProfile',
    builder: (BuildContext context, GoRouterState state) {
      return const JobSeekerScreen();
    },
  ),

GoRoute(
  path: '/editSoftSkillsSeeker',
  builder: (BuildContext context, GoRouterState state) {
    return const SoftSkillsSelectionScreen(isEditMode: true);
  },
),

]);
