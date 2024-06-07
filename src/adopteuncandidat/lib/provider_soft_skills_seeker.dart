import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoftSkillsNotifier extends StateNotifier<List<String>> {
  SoftSkillsNotifier() : super([]);

  static const int maxSoftSkills = 8;

  static const List<String> softSkills = [
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
    'Capacité de synthèse',
  ];


  List<String> get allSoftSkills => softSkills;

  void toggle(int index) {
    if (state.contains(softSkills[index])) {
      state = List.from(state)..remove(softSkills[index]);
    } else if (state.length < maxSoftSkills) {
      state = List.from(state)..add(softSkills[index]);
    }
  }

  bool isSelected(int index) {
    return state.contains(softSkills[index]);
  }

  String getNameOf(int index) {
    return softSkills[index];
  }

  int getSelectedCount() {
    return state.length;
  }

  List<String> getSelectedSkills() {
    return state;
  }

  void reset(){
    state = [];
  }
}

final softSkillsProvider = StateNotifierProvider<SoftSkillsNotifier, List<String>>((ref) {
  return SoftSkillsNotifier();
});
