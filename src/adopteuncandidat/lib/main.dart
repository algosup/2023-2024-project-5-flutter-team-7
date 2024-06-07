import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'provider_soft_skills_seeker.dart';
import 'common_layout.dart';
import 'login.dart';
import 'start.dart';
import 'sign_in.dart';
import 'sign_in_seeker.dart';
import 'matchmaking.dart';
import 'matchmaking_done.dart';
import 'soft_skills_selection_seeker.dart';
import 'hobbies_selection.dart';
import 'edit_soft_skills_seeker.dart';
import 'job_seeker_profile.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Wrap your MaterialApp.router with MultiProvider
      providers: [
        ChangeNotifierProvider(create: (_) => SoftSkillsProvider()), // Provide your SoftSkillsProvider
        // Add other providers here if necessary
      ],
      child: MaterialApp.router(
        title: 'Matchmaking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
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

class EditSoftSkillsSeekerLayout extends StatelessWidget {
  const EditSoftSkillsSeekerLayout({super.key, required selectedSoftSkills});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: EditSoftSkillsSeekerScreen(selectedSoftSkills: [],),
    );
  }
}

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

// class EditProfileLayout extends StatelessWidget {
//   const EditProfileLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CommonLayout(
//       body: const EditProfileScreen(),
//     );
//   }
// }