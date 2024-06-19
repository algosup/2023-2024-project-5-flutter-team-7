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
      const NetworkImage(
          'https://eu-images.contentstack.com/v3/assets/blt5004e64d3579c43f/blt6243759afdfd4588/61e5b45c35e87a3ac8bc4840/Logo_France_Mcdo.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://eu-images.contentstack.com/v3/assets/blt5004e64d3579c43f/bltca0f62bf135e82ae/61dc1ca53986d35c7f06f31b/Restaurant_McDo_Nimes_03.2028_3.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://www.societegenerale.com/sites/default/files/image/2023-04/logo-societe-generale.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://images.moneyvox.fr/i/media/10l/010068l08d.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://popgroup.global/wp-content/uploads/2017/11/carrefour-logo-1-300x300.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://www.actions-boursieres.fr/wp-content/uploads/2021/06/Carrefour.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://parknorthsa.com/wp-content/uploads/2020/08/logo_target.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://as2.ftcdn.net/v2/jpg/02/85/51/69/1000_F_285516958_ATM6mP5np2iGbygdeRAE94Qhmvwz5Qp6.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/7-eleven_logo.svg/495px-7-eleven_logo.svg.png'),
      context,
    );
    precacheImage(
      const NetworkImage('https://success-stories.fr/wp-content/uploads/7.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Jumbo_Logo.svg/2560px-Jumbo_Logo.svg.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://img.resized.co/esmmagazine/eyJkYXRhIjoie1widXJsXCI6XCJodHRwczpcXFwvXFxcL21lZGlhLm1hZGlzb25wdWJsaWNhdGlvbnMuZXVcXFwvZXNtbWFnYXppbmUtcHJvZFxcXC91cGxvYWRzXFxcLzIwMjRcXFwvMDFcXFwvMDMxMDMyNTZcXFwvanVtYm9ob29mZGthbnRvb3J2ZWdoZWwtc2NhbGVkLmpwZ1wiLFwid2lkdGhcIjoxMjAwLFwiaGVpZ2h0XCI6NjI3LFwiZGVmYXVsdFwiOlwiaHR0cHM6XFxcL1xcXC9pbWcucmVzaXplZC5jb1xcXC9uby1pbWFnZS5wbmdcIixcIm9wdGlvbnNcIjpbXX0iLCJoYXNoIjoiNGIyYzIyNjY5MjY0MzYxMDBkNzNmNmU1OGZkOWNkZjRkZGMyMzBhNSJ9/jumbo-to-cease-price-promotions-on-fresh-meat-in-the-netherlands.jpg'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Walmart_logo.svg/2560px-Walmart_logo.svg.png'),
      context,
    );
    precacheImage(
      const NetworkImage(
          'https://cdn.britannica.com/16/204716-050-8BB76BE8/Walmart-store-Mountain-View-California.jpg'),
      context,
    );
  }
}
