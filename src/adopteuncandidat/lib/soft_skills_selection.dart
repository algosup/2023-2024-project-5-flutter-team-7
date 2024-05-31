import 'package:flutter/material.dart';

class SoftSkillsSelectionScreen extends StatefulWidget {
  const SoftSkillsSelectionScreen({super.key});

  @override
  _SoftSkillsSelectionScreenState createState() => _SoftSkillsSelectionScreenState();
}

class _SoftSkillsSelectionScreenState extends State<SoftSkillsSelectionScreen> {
  // List to keep track of the state of the selected tags
  final List<bool> _isSelected = List<bool>.filled(27, false);
  // List of soft skills
  final List<String> _softSkills = [
    'Capacité à s’organiser',
    'Autonomie',
    'Auto-discipline',
    'Audace',
    'Gestion du temps',
    'Esprit d’équipe',
    'Négociation',
    'Tolérance',
    'Résolution de conflits',
    'Créer un réseau',
    'Attention et concentration',
    'Créativité',
    'Persévérance',
    'Curiosité intellectuelle',
    'Adaptabilité',
    'Sens des responsabilités',
    'Gestion du stress',
    'Esprit d’initiative',
    'Communication',
    'Empathie',
    'Capacité à déléguer',
    'Confiance en soi',
    'Leadership',
    'Mémoire',
    'Esprit critique',
    'Résilience',
    'Capacité de synthèse'
  ];

  // Method to count selected skills
  int get _selectedCount => _isSelected.where((element) => element).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Sélectionner les soft skills que vous possédez. SoftSkills: $_selectedCount/ max 8',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  color: Colors.lightBlue[50],
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 3.2,
                    ),
                    itemCount: _softSkills.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_isSelected[index]) {
                              _isSelected[index] = false; 
                            } else if (_selectedCount < 8) {
                              _isSelected[index] = true; 
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: _isSelected[index] ? Colors.red : Colors.grey[200],
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              _softSkills[index],
                              style: TextStyle(
                                color: _isSelected[index] ? Colors.white : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: _selectedCount > 0 ? () {
                    // Handle button press
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Suivant', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
