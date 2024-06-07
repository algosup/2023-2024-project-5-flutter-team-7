import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'providers/provider_soft_skills_seeker.dart';

class SignInSeekerScreen extends ConsumerStatefulWidget {
  const SignInSeekerScreen({super.key});

  @override

  ConsumerState<SignInSeekerScreen> createState() => _SignInSeekerScreenState();
}

class _SignInSeekerScreenState extends ConsumerState<SignInSeekerScreen> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  void _softSkillsSeeker() {
    ref.read(softSkillsProvider.notifier).reset();  
    context.go('/softSkillsSeeker');
    print('Soft Skills Seeker button pressed');
  }

  final List<int> _days = List<int>.generate(31, (index) => index + 1);
  final List<int> _months = List<int>.generate(12, (index) => index + 1);
  final List<int> _years = List<int>.generate(101, (index) => DateTime.now().year - index);

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 300,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Prénom*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton<int>(
                            hint: const Text('Jour*'),
                            value: _selectedDay,
                            items: _days.map((int day) {
                              return DropdownMenuItem<int>(
                                value: day,
                                child: Text(day.toString()),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedDay = newValue;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          DropdownButton<int>(
                            hint: const Text('Mois*'),
                            value: _selectedMonth,
                            items: _months.map((int month) {
                              return DropdownMenuItem<int>(
                                value: month,
                                child: Text(month.toString()),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedMonth = newValue;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          DropdownButton<int>(
                            hint: const Text('Année*'),
                            value: _selectedYear,
                            items: _years.map((int year) {
                              return DropdownMenuItem<int>(
                                value: year,
                                child: Text(year.toString()),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                _selectedYear = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Adresse Postale complète',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: _getLocation,
                            child: const Icon(Icons.location_searching),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    // add a padding with a text inside
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        'Information de connexion',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _softSkillsSeeker,
                      child: const Text('Connexion'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
