// providers/provider_matched_companies.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adopteuncandidat/models/matchmaking_model.dart';

class MatchedCompaniesNotifier
    extends StateNotifier<List<CompanyMatchmakingModel>> {
  MatchedCompaniesNotifier() : super([]);

  void setMatchedCompanies(List<CompanyMatchmakingModel> companies) {
    state = companies;
  }

  void addMatchedCompany(CompanyMatchmakingModel company) {
    state = [...state, company];
  }
}

final matchedCompaniesProvider = StateNotifierProvider<MatchedCompaniesNotifier,
    List<CompanyMatchmakingModel>>(
  (ref) => MatchedCompaniesNotifier(),
);
