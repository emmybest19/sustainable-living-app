import 'package:flutter/material.dart';

import 'package:sustainable_app/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f4),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.05),

                  // Title
                  Text(
                    "Start Your\nSustainable Journey",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle
                  Text(
                    "Create an account to join our community\nand track your progress.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // FULL NAME
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Full Name",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: "Enter your full name",
                    validator: (value) =>
                        value!.isEmpty ? "Full name is required" : null,
                  ),

                  const SizedBox(height: 24),

                  // EMAIL
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? "Email is required" : null,
                  ),

                  const SizedBox(height: 24),

                  // PASSWORD
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: "Enter your password",
                    obscureText: !_passwordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => _passwordVisible = !_passwordVisible);
                      },
                    ),
                    validator: (value) =>
                        value!.length < 6 ? "Password too short" : null,
                  ),

                  const SizedBox(height: 24),

                  // CONFIRM PASSWORD
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    hint: "Confirm your password",
                    obscureText: !_confirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () => _confirmPasswordVisible =
                              !_confirmPasswordVisible,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // CREATE ACCOUNT BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF356644),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          );
                        }
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LOGIN LINK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Color(0xFF356644),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // TERMS
                  Text(
                    "By creating an account, you agree to our\nTerms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable input widget
  Widget _inputField({
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Colors.green, width: 1.2),
        ),
      ),
    );
  }
}
