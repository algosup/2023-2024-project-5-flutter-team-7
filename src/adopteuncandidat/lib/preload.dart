import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreloadedAssets {
  static AssetImage signinCompanyBackground =
      const AssetImage('assets/signin_company.jpg');
  static AssetImage signinSeekerBackground =
      const AssetImage('assets/signin_seeker.jpg');

  static final List<AssetImage> _allAssets = [
    PreloadedAssets.signinCompanyBackground,
    PreloadedAssets.signinSeekerBackground,
  ];

  static void preloadAll(BuildContext context) {
    precacheImage(signinCompanyBackground, context);
    precacheImage(signinSeekerBackground, context);
  }
}
