import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInformation {
  String firstName;
  String lastName;
  String emailAdress;
  int? day;
  int? month;
  int? year;
  String address;
  String username;
  String password;

  PersonalInformation({
    required this.firstName,
    required this.lastName,
    required this.emailAdress,
    this.day,
    this.month,
    this.year,
    required this.address,
    required this.username,
    required this.password,
  });
}

class PersonalInformationNotifier extends StateNotifier<PersonalInformation> {
  PersonalInformationNotifier()
      : super(PersonalInformation(
          firstName: '',
          lastName: '',
          emailAdress: '',
          address: '',
          username: '',
          password: '',

        ));

  void updateFirstName(String firstName) {
    state = PersonalInformation(
      firstName: firstName,
      lastName: state.lastName,
      emailAdress: state.emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: state.address,
      username: state.username,
      password: state.password,
    );
  }

  void updateLastName(String lastName) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: lastName,
      emailAdress: state.emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: state.address,
      username: state.username,
      password: state.password,
    );
  }

  void updateDateOfBirth(int? day, int? month, int? year) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: state.lastName,
      emailAdress: state.emailAdress,
      day: day,
      month: month,
      year: year,
      address: state.address,
      username: state.username,
      password: state.password,
    );
  }

  void updateAddress(String address) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: state.lastName,
      emailAdress: state.emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: address,
      username: state.username,
      password: state.password,
    );
  }

  void updateUsername(String username) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: state.lastName,
      emailAdress: state.emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: state.address,
      username: username,
      password: state.password,
    );
  }

  void updatePassword(String password) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: state.lastName,
      emailAdress: state.emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: state.address,
      username: state.username,
      password: password,
    );
  }

  void updateEmailAdress(String emailAdress) {
    state = PersonalInformation(
      firstName: state.firstName,
      lastName: state.lastName,
      emailAdress: emailAdress,
      day: state.day,
      month: state.month,
      year: state.year,
      address: state.address,
      username: state.username,
      password: state.password,
    );
  }

  void reset() {
    state = PersonalInformation(
      firstName: '',
      lastName: '',
      emailAdress: '',
      address: '',
      username: '',
      password: '',
    );
  }
}

final personalInformationProvider = StateNotifierProvider<PersonalInformationNotifier, PersonalInformation>((ref) {
  return PersonalInformationNotifier();
});
