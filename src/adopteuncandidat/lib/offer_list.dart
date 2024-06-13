import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'layout/common_layout.dart';
import 'providers/provider_offer.dart';

class OfferListScreen extends ConsumerWidget {
  const OfferListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = ref.watch(offerProvider);

    return CommonLayout(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('List of Offers'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/recruiterProfile');
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/editOffer', extra: offer);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: Colors.lightBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Type de l\'emploi: ${offer.type}\nLieu de l\'emploi: ${offer.location}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
