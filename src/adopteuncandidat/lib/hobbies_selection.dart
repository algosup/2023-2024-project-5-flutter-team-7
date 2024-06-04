import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HobbiesSelectionScreen extends StatefulWidget {
  const HobbiesSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HobbiesSelectionScreenState createState() => _HobbiesSelectionScreenState();
}

class _HobbiesSelectionScreenState extends State<HobbiesSelectionScreen> {
  final TextEditingController _hobby1Controller = TextEditingController();
  final TextEditingController _hobby2Controller = TextEditingController();
  final TextEditingController _hobby3Controller = TextEditingController();
  bool isButtonEnabled = false;
  bool showSecondHobby = false;
  bool showThirdHobby = false;

  @override
  void initState() {
    super.initState();
    _hobby1Controller.addListener(_checkButtonEnable);
    _hobby2Controller.addListener(_checkButtonEnable);
    _hobby3Controller.addListener(_checkButtonEnable);
  }

  void _checkButtonEnable() {
    setState(() {
      isButtonEnabled = _hobby1Controller.text.isNotEmpty;

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

      // If the second hobby is deleted, promote the third hobby to be the second one
      if (_hobby2Controller.text.isEmpty && _hobby3Controller.text.isNotEmpty) {
        showSecondHobby = true;
        showThirdHobby = false;
        _hobby2Controller.text = _hobby3Controller.text;
        _hobby3Controller.text = '';
      }

      // If the first hobby is deleted, promote the second hobby to be the first one
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Sélectionnez au maximum 3 hobbies:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              _buildHobbyInput('Premier hobby', _hobby1Controller),
              const SizedBox(height: 20),
              if (showSecondHobby) ...[
                _buildHobbyInput('Second hobby', _hobby2Controller),
                const SizedBox(height: 20),
              ],
              if (showThirdHobby) ...[
                _buildHobbyInput('Troisième hobby', _hobby3Controller),
                const SizedBox(height: 20),
              ],
              const SizedBox(height: 30),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? () {
                    context.go('/matchmaking');
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Suivant', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            onChanged: (_) => _checkButtonEnable(),
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
