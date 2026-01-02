import 'package:flutter/material.dart';
import 'package:mypetjoyy/features/bottom_screen/screens/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;

  final screens = const [
    HomeScreen(),
    Center(child: Text("Cart")),
    Center(child: Text("Pets")),
    Center(child: Text("Calculator")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 70, 158, 221),
        unselectedItemColor: const Color.fromARGB(255, 192, 189, 189),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: ""),
        ],
      ),
    );
  }
}
