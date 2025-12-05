import 'package:flutter/material.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});

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
            colors: [
              Color.fromARGB(255, 252, 245, 233),
              Color.fromARGB(255, 252, 249, 232),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
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
                      color: Color.fromARGB(255, 123, 165, 228),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.pets,
                      size: 100,
                      color: Color.fromARGB(255, 123, 165, 228),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Find Your Perfect Pet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Fredoka",
                        fontSize: 32,
                        color: Color.fromARGB(133, 34, 44, 94),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Our smart quiz connects you with pets who match your lifestyle and love language",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Fredoka",
                          fontSize: 18,
                          color: Color.fromARGB(137, 10, 11, 40),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 123, 165, 228),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/onboarding_two");
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: "Fredoka",
                          fontSize: 20,
                          color: Colors.white,
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
