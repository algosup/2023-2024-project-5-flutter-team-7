import 'dart:ui';

class CompanyMatchmakingModel {
  final String name;
  final String location;
  final List<String> softskills;
  final String logoUrl;
  final String? backgroundUrl;
  final Color? backgroundColor;

  const CompanyMatchmakingModel({
    required this.name,
    required this.location,
    required this.softskills,
    required this.logoUrl,
    required this.backgroundUrl,
    required this.backgroundColor,
  });

  factory CompanyMatchmakingModel.fromJson(dynamic json) =>
      CompanyMatchmakingModel(
        name: json["name"] as String,
        location: json["location"] as String,
        softskills: json["softskills"] as List<String>,
        logoUrl: json["logoUrl"] as String,
        backgroundUrl: json["backgroundUrl"] as String?,
        backgroundColor: json["backgroundColor"] as Color?,
      );
}

// TODO: SeekerMatchmakingModel