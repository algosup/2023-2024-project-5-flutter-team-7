import 'package:adopteuncandidat/widgets/sign_in/animation.dart';
import 'package:flutter/material.dart';

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
  const SignInFooterSelection({
    required this.text,
    required this.icon,
    super.key,
  });

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
