import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SoftSkillsSelectionScreen extends StatefulWidget {
  const SoftSkillsSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SoftSkillsSelectionScreenState createState() => _SoftSkillsSelectionScreenState();
}

class _SoftSkillsSelectionScreenState extends State<SoftSkillsSelectionScreen> {
  final List<bool> _isSelected = List<bool>.filled(27, false);
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

  int get _selectedCount => _isSelected.where((element) => element).length;

  final ScrollController _scrollController = ScrollController();
  double _downArrowOpacity = 1.0;
  double _upArrowOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Hide the down arrow when the user reaches the bottom of the scrollable content
        _downArrowOpacity = _scrollController.position.pixels < _scrollController.position.maxScrollExtent ? 1.0 : 0.0;
        // Hide the up arrow when the user is at the top of the scrollable content
        _upArrowOpacity = _scrollController.position.pixels > 0 ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                'Sélectionner les soft skills que vous possédez. SoftSkills: $_selectedCount/8',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.lightBlue[50],
                      child: GridView.builder(
                        controller: _scrollController,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedOpacity(
                        opacity: _downArrowOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedOpacity(
                        opacity: _upArrowOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: _selectedCount > 0 ? () {
                      context.go('/hobbies');
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Suivant', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
