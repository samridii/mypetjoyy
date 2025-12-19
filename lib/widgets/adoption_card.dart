import 'package:flutter/material.dart';

class AdoptionCard extends StatelessWidget {
  const AdoptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 206, 245),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Meet Luna!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("She's waiting for a home"),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: const Text("Adopt")),
              ],
            ),
          ),
          const Icon(Icons.pets, size: 50),
        ],
      ),
    );
  }
}
