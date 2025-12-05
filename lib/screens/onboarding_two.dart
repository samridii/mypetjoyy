import 'package:flutter/material.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFECFEFF), Color(0xFFDEF3FF), Color(0xFFE0E7FF)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Skip Button top-right
              Positioned(
                top: 16,
                right: 16,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 16,
                      color: Color.fromARGB(162, 1, 51, 132),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      size: 100,
                      color: Color.fromARGB(255, 239, 227, 161),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Shop Premium Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Fredoka",
                        fontSize: 32,
                        color: Color.fromARGB(162, 1, 51, 132),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Premium products curated by vets, loved by pets, trusted by parents",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Fredoka",
                          fontSize: 19,
                          color: Color.fromARGB(135, 1, 10, 52),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 239, 227, 161),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/onboarding_three");
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: "Fredoka",
                          fontSize: 20,
                          color: Color.fromARGB(162, 1, 51, 132),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
