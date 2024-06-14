import 'package:adopteuncandidat/preload.dart';
import 'package:adopteuncandidat/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PreloadedAssets.preloadAll(context);
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Matchmaking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
