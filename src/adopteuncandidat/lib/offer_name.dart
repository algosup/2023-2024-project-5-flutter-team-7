import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'layout/common_layout.dart';
import 'providers/provider_hobbies_selection.dart';
import 'providers/provider_offer.dart';

class OfferNameScreen extends ConsumerStatefulWidget {
  const OfferNameScreen({super.key});

  @override
  ConsumerState<OfferNameScreen> createState() => _OfferNameScreenState();
}

class _OfferNameScreenState extends ConsumerState<OfferNameScreen> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _typeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hobbies = ref.watch(hobbiesProvider);

    // Delay the initialization to avoid modifying the provider during the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeControllers(hobbies);
    });

    return CommonLayout(
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Entrez des informations pour votre offre',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              _buildTextInput('Type de l\'emploi', _typeController),
              const SizedBox(height: 20),
              _buildTextInput('Lieu de l\'emploi', _locationController),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    if (_typeController.text.isNotEmpty &&
                        _locationController.text.isNotEmpty) {
                      final notifier = ref.read(offerProvider.notifier);
                      notifier.addOffer(
                        _typeController.text,
                        _locationController.text,
                      );
                      context.go('/offerList');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Confirmer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeControllers(List<String> hobbies) {
    if (hobbies.isNotEmpty) _typeController.text = hobbies[0];
    if (hobbies.length > 1) _locationController.text = hobbies[1];
  }

  Widget _buildTextInput(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: controller,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Placeholder',
            ),
          ),
        ),
      ],
    );
  }
}
