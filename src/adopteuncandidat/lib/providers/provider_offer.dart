import 'package:flutter_riverpod/flutter_riverpod.dart';

class Offer {
  final String type;
  final String location;

  Offer(this.type, this.location);
}

class OfferNotifier extends StateNotifier<List<Offer>> {
  OfferNotifier() : super([]);

  void addOffer(String type, String location) {
    state = [...state, Offer(type, location)];
  }

  void updateOffer(Offer offer, String newType, String newLocation) {
    state = state.map((o) {
      if (o == offer) {
        return Offer(newType, newLocation);
      }
      return o;
    }).toList();
  }

  void resetOffer() {
    state = [];
  }
}

final offerProvider = StateNotifierProvider<OfferNotifier, List<Offer>>((ref) {
  return OfferNotifier();
});
