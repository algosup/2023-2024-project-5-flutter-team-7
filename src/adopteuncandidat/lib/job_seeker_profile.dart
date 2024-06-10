import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobSeekerScreen extends StatelessWidget {
  const JobSeekerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              _buildOptionButton(context, 'Modifier mes informations personnelles', '/editProfile'),
              const SizedBox(height: 60),
              _buildOptionButton(context, 'Modifier mes soft skills', '/editSoftSkillsSeeker'),
              const SizedBox(height: 60),
              _buildOptionButton(context, 'Modifier mes hobbies', '/editHobbies'),
              const SizedBox(height: 60),
              _buildOptionButton(context, 'Voir mes matchs', '/viewMatches'),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomButton(context, 'Supprimer mon compte', '/deleteAccount'),
                  _buildBottomButton(context, 'Recommander un ami', '/reviewFriend'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
}