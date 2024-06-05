import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes.dart';
import 'login.dart';
import 'start.dart';
import 'sign_in.dart';
import 'sign_in_seeker.dart';
import 'soft_skills_selection.dart';
import 'hobbies_selection.dart';
import 'matchmaking.dart';
import 'matchmaking_done.dart';
import 'job_seeker_profile.dart';
import 'common_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Matchmaking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: LoginScreen(),
      ),
    );
  }
}

class StartLayout extends StatelessWidget {
  const StartLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StartScreen(),
      ),
    );
  }
}

class SignInLayout extends StatelessWidget {
  const SignInLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInScreen(),
      ),
    );
  }
}

class SignInSeekerLayout extends StatelessWidget {
  const SignInSeekerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInSeekerScreen(),
      ),
    );
  }
}

class MatchmakingLayout extends StatelessWidget {
  const MatchmakingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: Center(
        child: MatchmakingScreen(),
      ),
    );
  }
}

class MatchMakingDoneLayout extends StatelessWidget {
  const MatchMakingDoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: MatchmakingDoneScreen(),
    );
  }
}

class SoftSkillsSelectionLayout extends StatelessWidget {
  const SoftSkillsSelectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: SoftSkillsSelectionScreen(),
    );
  }
}

class HobbiesSelectionLayout extends StatelessWidget {
  const HobbiesSelectionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: HobbiesSelectionScreen(),
    );
  }
}

class JobSeekerLayout extends StatelessWidget {
  const JobSeekerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: JobSeekerScreen(),
    );
  }
}

// class EditSoftSkillsLayout extends StatelessWidget {
//   const EditSoftSkillsLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const EditSoftSkillsScreen(),
//     );
//   }
// }

// class EditHobbiesLayout extends StatelessWidget {
//   const EditHobbiesLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const EditHobbiesScreen(),
//     );
//   }
// }

// class ViewMatchesLayout extends StatelessWidget {
//   const ViewMatchesLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const ViewMatchesScreen(),
//     );
//   }
// }

// class DeleteAccountLayout extends StatelessWidget {
//   const DeleteAccountLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const DeleteAccountScreen(),
//     );
//   }
// }

// class ReviewFriendLayout extends StatelessWidget {
//   const ReviewFriendLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const ReviewFriendScreen(),
//     );
//   }
// }
