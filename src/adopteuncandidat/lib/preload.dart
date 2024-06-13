import 'package:flutter/material.dart';


class PreloadedAssets {
  static AssetImage signinCompanyBackground =
      const AssetImage('assets/signin_company.jpg');
  static AssetImage signinSeekerBackground =
      const AssetImage('assets/signin_seeker.jpg');

  static void preloadAll(BuildContext context) {
    precacheImage(signinCompanyBackground, context);
    precacheImage(signinSeekerBackground, context);
  }
}
