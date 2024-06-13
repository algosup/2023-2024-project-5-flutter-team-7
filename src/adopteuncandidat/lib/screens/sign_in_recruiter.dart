import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInRecruiterScreen extends ConsumerStatefulWidget {
  const SignInRecruiterScreen({super.key});

  @override
  ConsumerState<SignInRecruiterScreen> createState() =>
      _SignInCompanyScreenState();
}

class _SignInCompanyScreenState extends ConsumerState<SignInRecruiterScreen> {
  void _softSkillsRecruiter() {
    context.go('/recruiterProfile');
    print('Recruiter Profile Button Pressed');
  }

  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    const SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom de l’Entreprise*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Adresse Postal Complète*',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: _getLocation,
                            child: const Icon(Icons.location_searching),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text('Information de connexion'),
                    ),
                    ElevatedButton(
                      onPressed: _softSkillsRecruiter,
                      child: const Text('Connexion'),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
