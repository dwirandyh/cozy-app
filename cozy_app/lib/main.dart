import 'package:cozy_app/provider/SpaceProvider.dart';
import 'package:cozy_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        title: "Cozy App",
        home: const SplashScreenPage(),
      ),
    );
  }
}
