import 'package:flutter/material.dart';

class SoftSkill {
  final String name;
  bool isSelected;

  SoftSkill(this.name, {this.isSelected = false});
}

class SoftSkillsProvider extends ChangeNotifier {
  List<SoftSkill> softSkills = [
    SoftSkill('Capacité à s’organiser'),
    SoftSkill('Autonomie'),
    SoftSkill('Auto-discipline'),
    SoftSkill('Audace'),
    SoftSkill('Gestion du temps'),
    SoftSkill('Esprit d’équipe'),
    SoftSkill('Négociation'),
    SoftSkill('Tolérance'),
    SoftSkill('Résolution de conflits'),
    SoftSkill('Créer un réseau'),
    SoftSkill('Attention et concentration'),
    SoftSkill('Créativité'),
    SoftSkill('Persévérance'),
    SoftSkill('Curiosité intellectuelle'),
    SoftSkill('Adaptabilité'),
    SoftSkill('Sens des responsabilités'),
    SoftSkill('Gestion du stress'),
    SoftSkill('Esprit d’initiative'),
    SoftSkill('Communication'),
    SoftSkill('Empathie'),
    SoftSkill('Capacité à déléguer'),
    SoftSkill('Confiance en soi'),
    SoftSkill('Leadership'),
    SoftSkill('Mémoire'),
    SoftSkill('Esprit critique'),
    SoftSkill('Résilience'),
    SoftSkill('Capacité de synthèse')
  ];

  void select(int index) {
    softSkills[index].isSelected = true;
    notifyListeners();
  }

  void deselect(int index) {
    softSkills[index].isSelected = false;
    notifyListeners();
  }

  bool isSelected(int index) {
    return softSkills[index].isSelected;
  }

  List<String> getSelectedSkills() {
    return softSkills.where((skill) => skill.isSelected).map((skill) => skill.name).toList();
  }

  int getSelectedCount() {
    return softSkills.where((skill) => skill.isSelected).length;
  }
}
