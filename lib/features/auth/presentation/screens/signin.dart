import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.close, color: Colors.blue[300], size: 28),
                    Icon(
                      Icons.pets,
                      color: const Color.fromARGB(255, 195, 222, 228),
                      size: 40,
                    ),
                  ],
                ),
              ),

              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1976D2),
                ),
              ),

              const SizedBox(height: 20),

              Image.asset('assets/images/mpjlogo.png', height: 190),

              Padding(
                padding: const EdgeInsets.only(right: 40, top: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.pets,
                    color: const Color.fromARGB(255, 255, 221, 165),
                    size: 40,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF5C9FD6), Color(0xFF4A8BC2)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'MyPetJoy',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A5F),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: Builder(
                          builder: (context) => ElevatedButton(
                            onPressed: () {
                              if (usernameController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please fill all fields!"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB8B3E8),
                              foregroundColor: const Color(0xFF1E3A5F),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 252, 211),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
