import 'package:flutter/material.dart';

import 'package:sustainable_app/auth/forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Logo
              Icon(Icons.eco_rounded, size: 60, color: Colors.green.shade600),

              const SizedBox(height: 24),

              // Title
              Text(
                "Welcome Back",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Log in to your EcO-Journey",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 40),

              // Email Label
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),

              // Email Field
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outline),
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password Label
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),

              // Password Field
              TextField(
                obscureText: _obscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  ),
                  hintText: "Enter your password",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (ctx) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.green.shade600),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green.shade500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Login", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 32),

              // Divider with text
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade300),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Or continue with"),
                  ),
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade300),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Google + Apple buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 22,
                          ),
                          const SizedBox(width: 8),
                          const Text("Google"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/apple.png',
                            height: 22,
                          ),
                          const SizedBox(width: 8),
                          const Text("Apple"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Sign Up Redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
