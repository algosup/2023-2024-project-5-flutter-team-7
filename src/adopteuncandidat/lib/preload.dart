import 'package:flutter/material.dart';

class PreloadedAssets {
  static AssetImage signinCompanyBackground =
      const AssetImage('assets/signin_company.jpg');
  static AssetImage signinSeekerBackground =
      const AssetImage('assets/signin_seeker.jpg');

  static void preloadAll(BuildContext context) {
    precacheImage(signinCompanyBackground, context);
    precacheImage(signinSeekerBackground, context);
    precacheImage(
      const AssetImage('assets/companies/Logo_France_Mcdo.png'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/Restaurant_McDo_Nimes_03.2028_3.jpeg'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/logo-societe-generale.png'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/010068l08d.jpg'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/carrefour-logo-1-300x300.png'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/Carrefour.jpg'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/logo_target.webp'),
      context,
    );
    precacheImage(
      const AssetImage(
          'assets/companies/1000_F_285516958_ATM6mP5np2iGbygdeRAE94Qhmvwz5Qp6.jpg'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/7-eleven_logo.svg.png'),
      context,
    );
    precacheImage(
      const AssetImage('assets/companies/7.jpg'),
      context,
    );
    // precacheImage(
    //   const AssetImage(
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Jumbo_Logo.svg/2560px-Jumbo_Logo.svg.png'),
    //   context,
    // );
    // precacheImage(
    //   const AssetImage(
    //       'https://img.resized.co/esmmagazine/eyJkYXRhIjoie1widXJsXCI6XCJodHRwczpcXFwvXFxcL21lZGlhLm1hZGlzb25wdWJsaWNhdGlvbnMuZXVcXFwvZXNtbWFnYXppbmUtcHJvZFxcXC91cGxvYWRzXFxcLzIwMjRcXFwvMDFcXFwvMDMxMDMyNTZcXFwvanVtYm9ob29mZGthbnRvb3J2ZWdoZWwtc2NhbGVkLmpwZ1wiLFwid2lkdGhcIjoxMjAwLFwiaGVpZ2h0XCI6NjI3LFwiZGVmYXVsdFwiOlwiaHR0cHM6XFxcL1xcXC9pbWcucmVzaXplZC5jb1xcXC9uby1pbWFnZS5wbmdcIixcIm9wdGlvbnNcIjpbXX0iLCJoYXNoIjoiNGIyYzIyNjY5MjY0MzYxMDBkNzNmNmU1OGZkOWNkZjRkZGMyMzBhNSJ9/jumbo-to-cease-price-promotions-on-fresh-meat-in-the-netherlands.jpg'),
    //   context,
    // );
    // precacheImage(
    //   const AssetImage(
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Walmart_logo.svg/2560px-Walmart_logo.svg.png'),
    //   context,
    // );
    // precacheImage(
    //   const AssetImage(
    //       'https://cdn.britannica.com/16/204716-050-8BB76BE8/Walmart-store-Mountain-View-California.jpg'),
    //   context,
    // );
  }
}
