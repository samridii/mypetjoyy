import 'package:flutter/material.dart';
import 'package:mypetjoyy/widgets/adoption_card.dart';
import 'package:mypetjoyy/widgets/category_card.dart';
import 'package:mypetjoyy/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 900
              ? 900.0
              : constraints.maxWidth;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF7CC),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "Hello, Sarah!",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xFF93C5FD),
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("Find Your Pet's Needs"),
                          const SizedBox(height: 16),
                          Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 8),
                                Text(
                                  "Search",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 176, 175, 175),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.count(
                        crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                        children: const [
                          CategoryCard(title: "Shop"),
                          CategoryCard(title: "Adopt"),
                          CategoryCard(title: "Quiz"),
                          CategoryCard(title: "Calculator"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Featured Products",
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: const [
                          ProductCard(
                            imageUrl: "assets/images/dogchew.png",
                            title: "Natural Dog Chew",
                            price: "\$24.99",
                          ),
                          SizedBox(width: 16),
                          ProductCard(
                            imageUrl: "assets/images/fooddispenser.jpg",
                            title: "Food Dispenser",
                            price: "\$34.50",
                          ),
                          SizedBox(width: 16),
                          ProductCard(
                            imageUrl: "assets/images/earcleaner.png",
                            title: "Ear Cleaner",
                            price: "\$20.99",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AdoptionCard(),
                    ),

                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
