import 'package:flutter/material.dart';

class SoftSkillsSelectionScreen extends StatefulWidget {
  const SoftSkillsSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SoftSkillsSelectionScreenState createState() => _SoftSkillsSelectionScreenState();
}

class _SoftSkillsSelectionScreenState extends State<SoftSkillsSelectionScreen> {
  // List to keep track of the state of the checkboxes
  final List<bool> _isChecked = List<bool>.filled(27, false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red, 
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Cochez les softs skills que vous possédez:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  color: Colors.lightBlue[50], 
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      childAspectRatio: 4,
                      mainAxisSpacing: 0.001,
                      crossAxisSpacing: 0.001,
                    ),
                    itemCount: _softSkills.length, 
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(
                          _softSkills[index],
                          style: const TextStyle(fontSize: 14),
                        ),
                        value: _isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked[index] = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button background color
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