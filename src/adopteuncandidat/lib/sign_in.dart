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
        child: const SignInBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignInHeader(),
                SignInFooter(),
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

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SignInAnimation(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SignInFooterSelection(
              text: 'Recruteur',
              icon: Icons.business,
            ),
            SignInFooterSelection(
              text: 'Demandeur d\'emploi',
              icon: Icons.person,
            ),
          ],
        ),
      ],
    );
  }
}

class SignInFooterSelection extends StatelessWidget {
  final String text;
  final IconData icon;
  const SignInFooterSelection(
      {required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ), // Increased size of the icon
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInAnimation extends StatefulWidget {
  const SignInAnimation({super.key});

  @override
  State<SignInAnimation> createState() => _SignInAnimationState();
}

class _SignInAnimationState extends State<SignInAnimation>
    with TickerProviderStateMixin {
  static const double width = 80;
  static const double height = 20;

  late final AnimationController _translateController;
  late final Animation<double> _translateAnimation;
  bool _forward = true;

  @override
  void initState() {
    super.initState();

    _translateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _translateAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _translateController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeInOutCubic),
      ),
    );

    _translateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _forward = false;
        });
        _translateController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _forward = true;
        });
        _translateController.forward();
      }
    });

    _translateController.forward();
  }

  @override
  void dispose() {
    _translateController.dispose();
    super.dispose();
  }

  double getX() =>
      _translateAnimation.value * (width - height) - (width - height) / 2;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _translateController,
      builder: (context, child) => Column(
        children: [
          Text(
            _forward ? "Demandeur" : "Recruteur",
            style: const TextStyle(color: Colors.white),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(getX(), 0),
                child: SizedBox(
                  height: height * 0.8,
                  width: height * 0.8,
                  child: Container(
                      decoration: const BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
