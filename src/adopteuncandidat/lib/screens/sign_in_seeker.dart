import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import '../providers/provider_personal_information.dart';

class PersonalInformationScreen extends ConsumerStatefulWidget {
  final bool isEditMode;

  const PersonalInformationScreen({super.key, required this.isEditMode});

  @override
  ConsumerState<PersonalInformationScreen> createState() =>
      PersonalInformationScreenState();
}

class PersonalInformationScreenState
    extends ConsumerState<PersonalInformationScreen> {
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isPasswordConfirmationVisible = false;

  bool _isOlderThan16() {
    if (_selectedDay == null ||
        _selectedMonth == null ||
        _selectedYear == null) {
      return false;
    }

    DateTime birthdate =
        DateTime(_selectedYear!, _selectedMonth!, _selectedDay!);
    DateTime sixteenYearsAgo =
        DateTime.now().subtract(const Duration(days: 16 * 365));
    return birthdate.isBefore(sixteenYearsAgo);
  }

  bool _areAllFieldsFilled() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmationController.text.isNotEmpty &&
        _selectedDay != null &&
        _selectedMonth != null &&
        _selectedYear != null;
  }

  @override
  void initState() {
    super.initState();
    final personalInfo = ref.read(personalInformationProvider);

    _firstNameController.text = personalInfo.firstName;
    _lastNameController.text = personalInfo.lastName;
    _emailAddressController.text = personalInfo.emailAdress;
    _addressController.text = personalInfo.address;
    _usernameController.text = personalInfo.username;
    _passwordController.text = "";
    _passwordConfirmationController.text = "";
    _selectedDay = personalInfo.day;
    _selectedMonth = personalInfo.month;
    _selectedYear = personalInfo.year;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailAddressController.dispose();
    _addressController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  void _savePersonalInfo() {
    final notifier = ref.read(personalInformationProvider.notifier);

    if (!_areAllFieldsFilled()) {
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

    if (_passwordController.text != _passwordConfirmationController.text) {
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

    if (_isOlderThan16()) {
      notifier.updateFirstName(_firstNameController.text);
      notifier.updateLastName(_lastNameController.text);
      notifier.updateEmailAdress(_emailAddressController.text);
      notifier.updateAddress(_addressController.text);
      notifier.updateUsername(_usernameController.text);
      notifier.updatePassword(_passwordController.text);
      notifier.updateConfirmationPassword(_passwordController.text);
      notifier.updateDateOfBirth(_selectedDay, _selectedMonth, _selectedYear);

      if (widget.isEditMode) {
        context.go('/jobSeekerProfile');
      } else {
        context.go('/softSkillsSeeker');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'User must be at least 16 years old to save personal information.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    final List<int> days = List<int>.generate(31, (index) => index + 1);
    final List<int> months = List<int>.generate(12, (index) => index + 1);
    final List<int> years =
        List<int>.generate(101, (index) => DateTime.now().year - 16 - index);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditMode
            ? 'Modifier mes informations personnelles'
            : 'Connexion'),
        leading: widget.isEditMode
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/jobSeekerProfile');
                },
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/signIn');
                },
              ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nom*',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Prénom*',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton<int>(
                              hint: const Text('Jour*'),
                              value: _selectedDay,
                              items: days.map((int day) {
                                return DropdownMenuItem<int>(
                                  value: day,
                                  child: Text(day.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedDay = newValue;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            DropdownButton<int>(
                              hint: const Text('Mois*'),
                              value: _selectedMonth,
                              items: months.map((int month) {
                                return DropdownMenuItem<int>(
                                  value: month,
                                  child: Text(month.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedMonth = newValue;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            DropdownButton<int>(
                              hint: const Text('Année*'),
                              value: _selectedYear,
                              items: years.map((int year) {
                                return DropdownMenuItem<int>(
                                  value: year,
                                  child: Text(year.toString()),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedYear = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Adresse Postale complète',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: _getLocation,
                              child: const Icon(Icons.location_searching),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _emailAddressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adresse email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text(
                          'Information de connexion',
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nom d\'utilisateur',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Mot de passe',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: _passwordConfirmationController,
                          obscureText: !_isPasswordConfirmationVisible,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Confirmez votre mot de passe',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordConfirmationVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordConfirmationVisible =
                                      !_isPasswordConfirmationVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _savePersonalInfo,
                        child: Text(
                            widget.isEditMode ? 'Enregistrer' : 'Connexion'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0, right: 20.0),
              child: Text('* Ces informations ne seront pas divulguées'),
            ),
          ),
        ],
      ),
    );
  }
}
