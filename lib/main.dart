import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/core/services/hive/hive_service.dart';

import 'package:mypetjoyy/screens/dashboard_screen.dart';
import 'package:mypetjoyy/screens/onboarding_one.dart';
import 'package:mypetjoyy/screens/onboarding_three.dart';
import 'package:mypetjoyy/screens/onboarding_two.dart';
import 'package:mypetjoyy/features/auth/presentation/screens/signin.dart';
import 'package:mypetjoyy/features/auth/presentation/screens/signup.dart';
import 'package:mypetjoyy/screens/splash_screen.dart';
import 'package:mypetjoyy/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();
  await hiveService.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPetJoy',
      theme: getApplicationTheme(),

      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding_one': (context) => const OnboardingOneScreen(),
        '/onboarding_two': (context) => const OnboardingTwoScreen(),
        '/onboarding_three': (context) => const OnboardingThreeScreen(),
        '/signin': (context) => LoginScreen(),
        '/signup': (context) => RegisterScreen(),
        '/home': (context) => const DashboardScreen(),
      },
    );
  }
}
