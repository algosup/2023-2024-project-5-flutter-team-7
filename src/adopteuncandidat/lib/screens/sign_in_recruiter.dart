import 'package:adopteuncandidat/providers/provider_personal_information.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInRecruiterScreen extends ConsumerStatefulWidget {
  const SignInRecruiterScreen({super.key});

  @override
  ConsumerState<SignInRecruiterScreen> createState() =>
      _SignInCompanyScreenState();
}

class _SignInCompanyScreenState extends ConsumerState<SignInRecruiterScreen> {
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmationVisible = false;

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _postalAddressController =
      TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  bool _areAllFieldsFilled() {
    return _companyNameController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _postalAddressController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmationController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    final personalInfo = ref.read(personalInformationProvider);

    _companyNameController.text = personalInfo.companyName;
    _emailAddressController.text = personalInfo.emailAdress;
    _postalAddressController.text = personalInfo.address;
    _usernameController.text = personalInfo.username;
    _passwordController.text = "";
    _passwordConfirmationController.text = "";
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _postalAddressController.dispose();
    _emailAddressController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  void _savePersonalInfo() {
    if (false && !_areAllFieldsFilled()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'All fields are required.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }

    if (false &&
        _passwordController.text != _passwordConfirmationController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Passwords must be the same.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }
    context.go('/recruiterProfile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/signIn');
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _companyNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom de l’Entreprise*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _postalAddressController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Adresse Postal Complète*',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: _getLocation,
                            child: const Icon(Icons.location_searching),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: Text('Informations de connexion'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _emailAddressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adresse Mail*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nom d\'Utilisateur*',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Mot de Passe*',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isPasswordVisible = !_isPasswordVisible;
                                },
                              );
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _passwordConfirmationController,
                        obscureText: !_isPasswordConfirmationVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirmer le Mot de Passe*',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _isPasswordConfirmationVisible =
                                      !_isPasswordConfirmationVisible;
                                },
                              );
                            },
                            icon: Icon(
                              _isPasswordConfirmationVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _savePersonalInfo,
                      child: const Text('Connexion'),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
