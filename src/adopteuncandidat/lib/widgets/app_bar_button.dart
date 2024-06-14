import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final String route;
  final bool selected;

  const AppBarButton({
    super.key,
    required this.icon,
    required this.route,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final button = IconButton(
      iconSize: 30,
      color: Colors.black,
      alignment: Alignment.topLeft,
      icon: Icon(icon),
      onPressed: () {
        context.go(route);
      },
    );

    if (!selected) return button;

    return IgnorePointer(
      child: button,
    );
  }
}
