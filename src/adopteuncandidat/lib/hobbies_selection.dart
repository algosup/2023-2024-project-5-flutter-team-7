import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'layout/common_layout.dart';
import 'providers/provider_hobbies_selection.dart';

class HobbiesSelectionScreen extends ConsumerStatefulWidget {
  final bool isEditMode;

  const HobbiesSelectionScreen({super.key, required this.isEditMode});

  @override
  ConsumerState<HobbiesSelectionScreen> createState() => _HobbiesSelectionScreenState();
}

class _HobbiesSelectionScreenState extends ConsumerState<HobbiesSelectionScreen> {
  final TextEditingController _hobby1Controller = TextEditingController();
  final TextEditingController _hobby2Controller = TextEditingController();
  final TextEditingController _hobby3Controller = TextEditingController();
  bool showSecondHobby = false;
  bool showThirdHobby = false;

  @override
  void initState() {
    super.initState();
    _hobby1Controller.addListener(() => _updateHobby(0, _hobby1Controller.text));
    _hobby2Controller.addListener(() => _updateHobby(1, _hobby2Controller.text));
    _hobby3Controller.addListener(() => _updateHobby(2, _hobby3Controller.text));
  }

  void _updateHobby(int index, String hobby) {
    final notifier = ref.read(hobbiesProvider.notifier);
    if (hobby.isNotEmpty) {
      if (index < notifier.state.length) {
        notifier.updateHobby(index, hobby);
      } else {
        notifier.addHobby(hobby);
      }
    } else if (index < notifier.state.length) {
      notifier.removeHobby(index);
    }

    setState(() {
      if (_hobby1Controller.text.isNotEmpty && !showSecondHobby) {
        showSecondHobby = true;
      }
      if (_hobby2Controller.text.isNotEmpty && !showThirdHobby) {
        showThirdHobby = true;
      } else if (_hobby2Controller.text.isEmpty) {
        showThirdHobby = false;
      }
      if (_hobby1Controller.text.isEmpty) {
        showSecondHobby = false;
        showThirdHobby = false;
      }

      if (_hobby2Controller.text.isEmpty && _hobby3Controller.text.isNotEmpty) {
        showSecondHobby = true;
        showThirdHobby = false;
        _hobby2Controller.text = _hobby3Controller.text;
        _hobby3Controller.text = '';
      }

      if (_hobby1Controller.text.isEmpty && _hobby2Controller.text.isNotEmpty) {
        _hobby1Controller.text = _hobby2Controller.text;
        _hobby2Controller.text = _hobby3Controller.text;
        _hobby3Controller.text = '';
        showSecondHobby = true;
        showThirdHobby = false;
      }
    });
  }

  @override
  void dispose() {
    _hobby1Controller.dispose();
    _hobby2Controller.dispose();
    _hobby3Controller.dispose();
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
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                widget.isEditMode
                    ? 'Modifier tes hobbies:'
                    : 'Sélectionnez au maximum 3 hobbies:',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              _buildHobbyInput('Premier hobby', _hobby1Controller),
              const SizedBox(height: 20),
              if (showSecondHobby || hobbies.length > 1)
                ...[
                  _buildHobbyInput('Second hobby', _hobby2Controller),
                  const SizedBox(height: 20),
                ],
              if (showThirdHobby || hobbies.length > 2)
                ...[
                  _buildHobbyInput('Troisième hobby', _hobby3Controller),
                  const SizedBox(height: 20),
                ],
              const SizedBox(height: 30),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: hobbies.isNotEmpty
                      ? () {
                          if (widget.isEditMode) {
                            context.go('/jobSeekerProfile');
                          } else {
                            context.go('/matchmaking');
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    widget.isEditMode ? 'Confirmer' : 'Suivant',
                    style: const TextStyle(color: Colors.white),
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
    if (hobbies.isNotEmpty) _hobby1Controller.text = hobbies[0];
    if (hobbies.length > 1) _hobby2Controller.text = hobbies[1];
    if (hobbies.length > 2) _hobby3Controller.text = hobbies[2];
  }

  Widget _buildHobbyInput(String label, TextEditingController controller) {
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
            onChanged: (_) => setState(() {}), // Triggers a rebuild to update the UI
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
