import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecruiterScreen extends StatelessWidget {
  const RecruiterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      model: LayoutModel(LayoutType.editProfile, UserType.company),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildOptionButton(context, 'Créer Une Offre', '/createOffer'),
            const SizedBox(height: 40),
            _buildOptionButton(context, 'Gerer Mes Offres', '/offerList'),
            const SizedBox(height: 40),
            _buildOptionButton(
                context, 'Voir mes matchs', '/viewRecruiterMatch'),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBottomButton(
                    context, 'Supprimer ce compte', '/deleteAccount'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildOptionButton(BuildContext context, String text, String route) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        context.go(route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget _buildBottomButton(BuildContext context, String text, String route) {
  return ElevatedButton(
    onPressed: () {
      context.go(route);
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(140, 40),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
  );
}
