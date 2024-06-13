import 'package:adopteuncandidat/screens/hobbies_selection.dart';
import 'package:adopteuncandidat/screens/job_seeker_profile.dart';
import 'package:adopteuncandidat/screens/login.dart';
import 'package:adopteuncandidat/screens/matchmaking_company.dart';
import 'package:adopteuncandidat/screens/matchmaking_company_done.dart';
import 'package:adopteuncandidat/screens/offer_creation.dart';
import 'package:adopteuncandidat/screens/recruiter_profile.dart';
import 'package:adopteuncandidat/screens/sign_in.dart';
import 'package:adopteuncandidat/screens/sign_in_recruiter.dart';
import 'package:adopteuncandidat/screens/sign_in_seeker.dart';
import 'package:adopteuncandidat/screens/soft_skills_selection_seeker.dart';
import 'package:adopteuncandidat/screens/start.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
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
        return const PersonalInformationScreen(
          isEditMode: false,
        );
      },
    ),
    GoRoute(
      name: 'editProfileSeeker',
      path: '/editProfileSeeker',
      builder: (BuildContext context, GoRouterState state) {
        return const PersonalInformationScreen(
          isEditMode: true,
        );
      },
    ),
    GoRoute(
      name: 'matchmaking',
      path: '/matchmaking',
      builder: (BuildContext context, GoRouterState state) {
        return CompanyMatchmakingScreen(uri: state.uri);
      },
    ),
    GoRoute(
      name: 'matchmakingDone',
      path: '/matchmakingDone',
      builder: (BuildContext context, GoRouterState state) {
        return const CompanyMatchmakingDoneScreen();
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
        return const HobbiesSelectionScreen(
          isEditMode: false,
        );
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
    GoRoute(
      name: 'signInRecruiter',
      path: '/signinRecruiter',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInRecruiterScreen();
      },
    ),
    GoRoute(
      name: 'recruiterProfile',
      path: '/recruiterProfile',
      builder: (BuildContext context, GoRouterState state) {
        return const RecruiterScreen();
      },
    ),
    GoRoute(
      path: '/editSoftSkillsSeeker',
      builder: (BuildContext context, GoRouterState state) {
        return const SoftSkillsSelectionScreen(isEditMode: true);
      },
    ),
    GoRoute(
      name: 'createOffer',
      path: '/createOffer',
      builder: (BuildContext context, GoRouterState state) {
        return const OfferCreationScreen();
      },
    ),
  ],
);
