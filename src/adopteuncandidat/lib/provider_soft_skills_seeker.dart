import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoftSkillState {
  final List<int> selectedSoftSkills;

  const SoftSkillState({required this.selectedSoftSkills});
}

class SoftSkillsNotifier extends StateNotifier<SoftSkillState> {
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

  SoftSkillsNotifier() : super(const SoftSkillState(selectedSoftSkills: []));

  void select(int index) {
    if (state.selectedSoftSkills.length >= maxSoftSkills) return;
    if (state.selectedSoftSkills.contains(index)) return;
    state = SoftSkillState(selectedSoftSkills: [
      ...state.selectedSoftSkills,
      index,
    ]);
  }

  void deselect(int index) {
    state = SoftSkillState(
      selectedSoftSkills:
          state.selectedSoftSkills.where((i) => i != index).toList(),
    );
  }

  void toggle(int index) {
    if (isSelected(index)) {
      deselect(index);
    } else {
      select(index);
    }
  }

  bool isSelected(int index) => state.selectedSoftSkills.contains(index);

  List<String> getSelectedSkills() =>
      state.selectedSoftSkills.map((i) => softSkills[i]).toList();

  int getSelectedCount() => state.selectedSoftSkills.length;

  String getNameOf(int index) => softSkills[index];
}

final softSkillsProvider =
    StateNotifierProvider<SoftSkillsNotifier, SoftSkillState>(
  (ref) => SoftSkillsNotifier(),
);
