import 'package:adopteuncandidat/preload.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _onSeekerPressed() {
    context.go('/SignInSeeker');
    print('Seeker button pressed');
  }

  void _onRecruiterPressed() {
    context.go('/SignInRecruiter');
    print('Recruiter button pressed');
  }

  void _handleSwipe(DragEndDetails details) {
    const threshold = 300;
    if (details.primaryVelocity! > threshold) {
      _onSeekerPressed();
    } else if (details.primaryVelocity! < -threshold) {
      _onRecruiterPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: _handleSwipe,
        child: SignInBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Qui êtes-vous ?',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInBackground extends StatelessWidget {
  final Widget child;

  const SignInBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Image(
              image: PreloadedAssets.signinCompanyBackground,
              height: constraints.maxHeight,
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.none,
              alignment: Alignment.centerLeft,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.475, 0.525],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image(
                image: PreloadedAssets.signinSeekerBackground,
                height: constraints.maxHeight,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.none,
                alignment: Alignment.centerRight,
              ),
            ),
            child,
          ],
        );
      },
    );
  }
}
