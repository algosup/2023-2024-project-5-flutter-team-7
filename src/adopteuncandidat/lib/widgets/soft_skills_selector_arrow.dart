import 'package:flutter/material.dart';

class SoftSkillsSelectorArrow extends StatelessWidget {
  final IconData icon;
  final Alignment alignment;
  final double opacity;

  const SoftSkillsSelectorArrow({
    super.key,
    required this.icon,
    required this.alignment,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
