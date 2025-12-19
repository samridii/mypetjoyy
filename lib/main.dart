import 'package:flutter/material.dart';

import 'package:mypetjoyy/screens/dashboard_screen.dart';
import 'package:mypetjoyy/screens/onboarding_one.dart';
import 'package:mypetjoyy/screens/onboarding_three.dart';
import 'package:mypetjoyy/screens/onboarding_two.dart';
import 'package:mypetjoyy/screens/signin.dart';
import 'package:mypetjoyy/screens/signup.dart';
import 'package:mypetjoyy/screens/splash_screen.dart';
import 'package:mypetjoyy/theme/theme_data.dart';

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

      theme: getApplicationTheme(),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding_one': (context) => const OnboardingOneScreen(),
        '/onboarding_two': (context) => const OnboardingTwoScreen(),
        '/onboarding_three': (context) => const OnboardingThreeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => const DashboardScreen(),
      },
    );
  }
}
