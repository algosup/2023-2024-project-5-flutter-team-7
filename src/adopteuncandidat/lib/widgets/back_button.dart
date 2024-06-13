import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBackButton extends StatelessWidget {
  final String location;
  final Widget content;

  const GoBackButton({
    super.key,
    required this.content,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () => context.go(location),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
