// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:sustainable_app/auth_screens/login_screen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   bool _passwordVisible = false;
//   bool _confirmPasswordVisible = false;
//
//   Future<String?> signup(String fullname, String email, String password) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: const Color(0xfff7f7f4),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: height * 0.05),
//
//                   // Title
//                   Text(
//                     "Start Your\nSustainable Journey",
//                     textAlign: TextAlign.center,
//                     style: theme.textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//
//                   // Subtitle
//                   Text(
//                     "Create an account to join our community\nand track your progress.",
//                     textAlign: TextAlign.center,
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey[600],
//                       height: 1.4,
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   // FULL NAME
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Full Name",
//                       style: theme.textTheme.titleMedium,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   _inputField(
//                     hint: "Enter your full name",
//                     validator: (value) =>
//                         value!.isEmpty ? "Full name is required" : null,
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // EMAIL
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Email", style: theme.textTheme.titleMedium),
//                   ),
//                   const SizedBox(height: 8),
//                   _inputField(
//                     hint: "Enter your email",
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) =>
//                         value!.isEmpty ? "Email is required" : null,
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // PASSWORD
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Password", style: theme.textTheme.titleMedium),
//                   ),
//                   const SizedBox(height: 8),
//                   _inputField(
//                     hint: "Enter your password",
//                     obscureText: !_passwordVisible,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _passwordVisible
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         setState(() => _passwordVisible = !_passwordVisible);
//                       },
//                     ),
//                     validator: (value) =>
//                         value!.length < 6 ? "Password too short" : null,
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // CONFIRM PASSWORD
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Confirm Password",
//                       style: theme.textTheme.titleMedium,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   _inputField(
//                     hint: "Confirm your password",
//                     obscureText: !_confirmPasswordVisible,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _confirmPasswordVisible
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         setState(
//                           () => _confirmPasswordVisible =
//                               !_confirmPasswordVisible,
//                         );
//                       },
//                     ),
//                   ),
//
//                   const SizedBox(height: 32),
//
//                   // CREATE ACCOUNT BUTTON
//                   SizedBox(
//                     width: double.infinity,
//                     child: FilledButton(
//                       style: FilledButton.styleFrom(
//                         backgroundColor: const Color(0xFF356644),
//                         padding: const EdgeInsets.symmetric(vertical: 18),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (ctx) => LoginScreen()),
//                           );
//                         }
//                       },
//                       child: const Text(
//                         "Create Account",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // LOGIN LINK
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account?",
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Log in",
//                           style: TextStyle(
//                             color: Color(0xFF356644),
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // TERMS
//                   Text(
//                     "By creating an account, you agree to our\nTerms of Service and Privacy Policy.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.grey[500], fontSize: 12),
//                   ),
//
//                   const SizedBox(height: 40),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Reusable input widget
//   Widget _inputField({
//     required String hint,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       validator: validator,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 16,
//         ),
//         suffixIcon: suffixIcon,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(24),
//           borderSide: BorderSide(color: Colors.grey.shade300),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(24),
//           borderSide: const BorderSide(color: Colors.green, width: 1.2),
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sustainable_app/auth_screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  Future<String?> signup(String fullname, String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Update displayName
      await cred.user?.updateDisplayName(fullname);
      await cred.user?.reload(); // ensure updated user data
      return null;
    } on FirebaseAuthException catch (e) {
      // Map some common codes to friendlier messages
      switch (e.code) {
        case 'email-already-in-use':
          return 'This email is already in use.';
        case 'invalid-email':
          return 'The email address is invalid.';
        case 'weak-password':
          return 'The password is too weak (min 6 chars).';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled in Firebase.';
        default:
          return e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      return 'An error occurred. Please try again.';
    }
  }

  void _handleCreateAccount() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final fullName = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;

    final error = await signup(fullName, email, password);

    setState(() => _isLoading = false);

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    } else {
      // Success — navigate to login (or home)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      // Optionally clear fields:
      _formKey.currentState?.reset();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
      );
    }
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
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
                  Text(
                    "Start Your\nSustainable Journey",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Create an account to join our community\nand track your progress.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Full name
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Full Name", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    controller: _nameCtrl,
                    hint: "Enter your full name",
                    validator: (value) =>
                    (value == null || value.trim().isEmpty) ? "Full name is required" : null,
                  ),
                  const SizedBox(height: 24),

                  // Email
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    controller: _emailCtrl,
                    hint: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return "Email is required";
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value.trim())) return "Enter a valid email";
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    controller: _passwordCtrl,
                    hint: "Enter your password",
                    obscureText: !_passwordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => _passwordVisible = !_passwordVisible);
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Password is required";
                      if (value.length < 6) return "Password too short";
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Confirm password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Confirm Password", style: theme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  _inputField(
                    controller: _confirmPasswordCtrl,
                    hint: "Confirm your password",
                    obscureText: !_confirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => _confirmPasswordVisible = !_confirmPasswordVisible);
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please confirm password";
                      if (value != _passwordCtrl.text) return "Passwords do not match";
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Button
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
                      onPressed: _isLoading ? null : _handleCreateAccount,
                      child: _isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                          : const Text(
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

                  // Login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(color: Colors.grey[700])),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                        },
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
                  const Text(
                    "By creating an account, you agree to our\nTerms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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
}
