import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

typedef JsonMap = Map<String, dynamic>;

final Random rng = Random();

Future<JsonMap> getRandomCompany() async {
  final raw = await rootBundle.loadString('assets/mock_companies.json');
  final List<JsonMap> companies = List<JsonMap>.from(jsonDecode(raw));
  final index = rng.nextInt(companies.length);
  print("Selected: $index");
  final company = companies[index];
  return company;
}
