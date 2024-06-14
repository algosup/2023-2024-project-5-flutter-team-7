import 'package:adopteuncandidat/preload.dart';
import 'package:flutter/material.dart';

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
