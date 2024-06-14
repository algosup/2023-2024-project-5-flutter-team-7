import 'package:adopteuncandidat/models/matchmaking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchmakingState {
  final CompanyMatchmakingModel? company;
  // final SeekerMatchmakingModel? seeker;

  const MatchmakingState({required this.company});
}

class MatchmakingNotifier extends StateNotifier<MatchmakingState> {
  MatchmakingNotifier() : super(const MatchmakingState(company: null));

  void setCompany(CompanyMatchmakingModel model) {
    state = MatchmakingState(company: model);
  }
}

final matchmakingProvider =
    StateNotifierProvider<MatchmakingNotifier, MatchmakingState>(
  (ref) => MatchmakingNotifier(),
);

