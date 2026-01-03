import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/features/auth/presentation/screens/signup.dart';
import 'package:mypetjoyy/features/auth/presentation/state/auth_state.dart';
import 'package:mypetjoyy/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:mypetjoyy/features/bottom_screen/screens/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    ref.listen(authViewModelProvider, (_, next) {
      if (next.status == AuthStatus.authenticated) {
        Navigator.pushReplacementNamed(context, '/home');
      }
      if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'Invalid credentials'),
            backgroundColor: Colors.red,
          ),
        );
        ref.read(authViewModelProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/splash'),
                      child: Icon(
                        Icons.close,
                        color: Colors.blue[300],
                        size: 28,
                      ),
                    ),
                    const Icon(
                      Icons.pets,
                      color: Color.fromARGB(255, 195, 222, 228),
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

              Image.asset('assets/images/mpjlogo.png', height: 180),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5C9FD6), Color(0xFF4A8BC2)],
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      _field(emailController),

                      const SizedBox(height: 20),

                      const Text(
                        'Password',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      _field(passwordController, obscure: true),

                      const SizedBox(height: 30),

                      Center(
                        child: ElevatedButton(
                          onPressed: authState.status == AuthStatus.loading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    ref
                                        .read(authViewModelProvider.notifier)
                                        .login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB8B3E8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: authState.status == AuthStatus.loading
                              ? const CircularProgressIndicator(strokeWidth: 2)
                              : const Text(
                                  'Sign in',
                                  style: TextStyle(fontSize: 18),
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
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 250, 252, 211),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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

  Widget _field(TextEditingController c, {bool obscure = false}) =>
      TextFormField(
        controller: c,
        obscureText: obscure,
        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
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
      );
}
