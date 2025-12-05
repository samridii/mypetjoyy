import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(183, 135, 182, 226), Color(0xFFFFF8C7)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 280,
              child: Image(
                image: AssetImage("assets/images/mpjlogo.png"),
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "MyPetJoy",
              style: TextStyle(
                fontFamily: "Fredoka",
                fontSize: 40,
                color: Color(0xFF1D4075),
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your one-stop app for\nAdopt, Shop & Pet Care",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Fredoka",
                fontSize: 19,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/onboarding_one");
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 178, 175, 225),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.pets, size: 34, color: Color(0xFFE8C252)),
                SizedBox(width: 12),
                Icon(
                  Icons.pets,
                  size: 34,
                  color: Color.fromARGB(255, 114, 157, 222),
                ),
                SizedBox(width: 12),
                Icon(Icons.pets, size: 34, color: Color(0xFFE8C252)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
