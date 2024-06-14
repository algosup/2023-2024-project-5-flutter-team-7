import 'package:flutter_riverpod/flutter_riverpod.dart';

class HobbiesNotifier extends StateNotifier<List<String>> {
  HobbiesNotifier() : super([]);

  void addHobby(String hobby) {
    state = [...state, hobby];
  }

  void updateHobby(int index, String hobby) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) hobby else state[i]
    ];
  }

  void removeHobby(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }

  void reset() {
    state = [];
  }
}

final hobbiesProvider = StateNotifierProvider<HobbiesNotifier, List<String>>(
  (ref) => HobbiesNotifier(),
);
