import 'package:flutter/material.dart';
import 'package:mypetjoyy/screens/onboarding_one.dart';
import 'package:mypetjoyy/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPetJoy',
      theme: ThemeData(fontFamily: 'Fredoka'),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding_one': (context) => const OnboardingOneScreen(),
      },
    );
  }
}
