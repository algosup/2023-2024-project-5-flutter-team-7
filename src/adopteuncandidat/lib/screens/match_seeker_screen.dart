import 'package:adopteuncandidat/providers/provider_matched_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MatchViewSeekerScreen extends ConsumerWidget {
  const MatchViewSeekerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchedCompanies = ref.watch(matchedCompaniesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matched Companies'),
        // add back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/jobSeekerProfile');
          },
        ),
      ),
      body: matchedCompanies.isEmpty
          ? const Center(child: Text('No matched companies yet.'))
          : ListView.builder(
              itemCount: matchedCompanies.length,
              itemBuilder: (context, index) {
                final company = matchedCompanies[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(company.logoUrl),
                    title: Text(company.name),
                    subtitle: Text(company.location),
                    onTap: () {
                      // Optionally, navigate to a detailed view of the company
                    },
                  ),
                );
              },
            ),
    );
  }
}
