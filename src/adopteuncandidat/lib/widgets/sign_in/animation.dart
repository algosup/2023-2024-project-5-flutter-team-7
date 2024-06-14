import 'package:flutter/material.dart';

class SignInAnimation extends StatefulWidget {
  const SignInAnimation({super.key});

  @override
  State<SignInAnimation> createState() => _SignInAnimationState();
}

class _SignInAnimationState extends State<SignInAnimation>
    with TickerProviderStateMixin {
  static const double width = 60;
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
