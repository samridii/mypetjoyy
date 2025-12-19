import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.category;

    if (title == "Shop") icon = Icons.shopping_bag;
    if (title == "Adopt") icon = Icons.pets;
    if (title == "Quiz") icon = Icons.quiz;
    if (title == "Calculator") icon = Icons.calculate;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 209, 238),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color.fromARGB(255, 252, 250, 226)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 174, 170, 170),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
