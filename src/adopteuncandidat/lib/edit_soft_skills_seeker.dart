import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'provider_soft_skills_seeker.dart';

class EditSoftSkillsSeekerScreen extends StatefulWidget {
  final List<String> selectedSoftSkills;

  const EditSoftSkillsSeekerScreen({super.key, required this.selectedSoftSkills});

  @override
  // ignore: library_private_types_in_public_api
  _EditSoftSkillsSeekerScreenState createState() => _EditSoftSkillsSeekerScreenState();
}

class _EditSoftSkillsSeekerScreenState extends State<EditSoftSkillsSeekerScreen> {
  late List<bool> _isSelected;
  late List<String> _softSkills;
  

  @override
  void initState() {
  super.initState();
  final softSkillsProvider = SoftSkillsProvider();
  _softSkills = softSkillsProvider.softSkills.map((skill) => skill.name).toList();
  _isSelected = List<bool>.filled(_softSkills.length, false);
  for (int i = 0; i < _softSkills.length; i++) {
    if (widget.selectedSoftSkills.contains(_softSkills[i])) {
      _isSelected[i] = true;
    }
  }
  print('Received Selected Skills: ${widget.selectedSoftSkills}');
}

  int get _selectedCount => _isSelected.where((element) => element).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Soft Skills'),
      ),
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
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                _softSkills[index],
                                style: TextStyle(
                                  color: _isSelected[index] ? Colors.white : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      List<String> selectedSoftSkills = [];
                      for (int i = 0; i < _isSelected.length; i++) {
                        if (_isSelected[i]) {
                          selectedSoftSkills.add(_softSkills[i]);
                        }
                      }
                      context.go('/next_page', extra: selectedSoftSkills);
                    },
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
