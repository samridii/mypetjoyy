import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mypetjoyy/features/auth/presentation/state/auth_state.dart';
import 'package:mypetjoyy/features/auth/presentation/view_model/auth_view_model.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    ref.listen(authViewModelProvider, (_, next) {
      if (next.status == AuthStatus.registered) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Please log in.'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacementNamed(context, '/signin');
      }

      if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'Registration failed'),
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
              _topBar(context),
              _title('Create an Account'),
              const SizedBox(height: 20),
              Image.asset('assets/images/mpjlogo.png', height: 180),
              _blueContainer(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('Full Name'),
                      _field(nameController, validator: _required),

                      _label('Email'),
                      _field(emailController, validator: _required),

                      _label('Password'),
                      _field(
                        passwordController,
                        obscure: true,
                        validator: _password,
                      ),

                      _label('Confirm Password'),
                      _field(
                        confirmPasswordController,
                        obscure: true,
                        validator: (v) => v != passwordController.text
                            ? 'Passwords do not match'
                            : null,
                      ),

                      const SizedBox(height: 30),
                      _button(
                        text: 'Sign Up',
                        loading: authState.status == AuthStatus.loading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(authViewModelProvider.notifier)
                                .register(
                                  fullName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                      ),

                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                            context,
                            '/signin',
                          ),
                          child: const Text(
                            'Already have an account? Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
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

  Widget _topBar(BuildContext context) => Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: Colors.blue[300]),
        ),
        const Icon(
          Icons.pets,
          color: Color.fromARGB(255, 195, 222, 228),
          size: 40,
        ),
      ],
    ),
  );

  Widget _title(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1976D2),
    ),
  );

  Widget _blueContainer({required Widget child}) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(32),
    decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xFF5C9FD6), Color(0xFF4A8BC2)]),
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    child: child,
  );

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
  );

  Widget _field(
    TextEditingController c, {
    bool obscure = false,
    String? Function(String?)? validator,
  }) => TextFormField(
    controller: c,
    obscureText: obscure,
    validator: validator,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  Widget _button({
    required String text,
    required bool loading,
    required VoidCallback onTap,
  }) => Center(
    child: ElevatedButton(
      onPressed: loading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB8B3E8),
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: loading
          ? const CircularProgressIndicator(strokeWidth: 2)
          : Text(text),
    ),
  );

  String? _required(String? v) => v == null || v.isEmpty ? 'Required' : null;
  String? _password(String? v) =>
      v == null || v.length < 6 ? 'Minimum 6 characters' : null;
}
