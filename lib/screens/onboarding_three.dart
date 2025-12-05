import 'package:flutter/material.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({super.key});

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
              Color.fromARGB(255, 254, 255, 240),
              Color.fromARGB(255, 250, 237, 252),
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
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 16,
                      color: Color.fromARGB(255, 178, 175, 225),
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
                      Icons.calculate,
                      size: 100,
                      color: Color.fromARGB(255, 178, 175, 225),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Smart Planning for Your Pet’s Care Costs",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Fredoka",
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(226, 231, 219, 58),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Quickly estimate food, vet, and supply expenses with our smart cost calculator — because smart pet parents plan ahead.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Fredoka",
                          fontSize: 18,
                          color: Color.fromARGB(136, 20, 1, 26),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 178, 175, 225),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        shadowColor: const Color(0xFF5A4DA1).withOpacity(0.5),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signin');
                      },
                      child: const Text(
                        "Get Started",
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
