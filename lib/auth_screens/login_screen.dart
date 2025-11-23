// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:sustainable_app/auth_screens/forget_password_screen.dart';
// import 'package:sustainable_app/auth_screens/register_screen.dart'; // adjust path if needed
// import 'package:sustainable_app/dashboards/home.dart'; // optional: destination after login
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailCtrl = TextEditingController();
//   final _passwordCtrl = TextEditingController();
//   bool _obscure = true;
//   bool _isLoading = false;
//
//   @override
//   void dispose() {
//     _emailCtrl.dispose();
//     _passwordCtrl.dispose();
//     super.dispose();
//   }
//
//   Future<String?> _signIn(String email, String password) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return null;
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case 'user-not-found':
//           return 'No account found for that email.';
//         case 'wrong-password':
//           return 'Incorrect password. Try again.';
//         case 'invalid-email':
//           return 'That email address is invalid.';
//         case 'user-disabled':
//           return 'This user has been disabled.';
//         case 'too-many-requests':
//           return 'Too many attempts. Try again later.';
//         default:
//           return e.message ?? 'An unknown error occurred.';
//       }
//     } catch (e) {
//       return 'An error occurred. Please try again.';
//     }
//   }
//
//   void _onLoginPressed() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() => _isLoading = true);
//
//     final email = _emailCtrl.text.trim();
//     final password = _passwordCtrl.text;
//
//     final error = await _signIn(email, password);
//
//     setState(() => _isLoading = false);
//
//     if (error != null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text(error)));
//       return;
//     }
//
//     // Success — navigate to home (or wherever you want)
//     // Replace HomeScreen() below with your app's main screen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (ctx) => const Home(),
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 40),
//
//                 // Logo
//                 Icon(Icons.eco_rounded, size: 60, color: Colors.green.shade600),
//
//                 const SizedBox(height: 24),
//
//                 // Title
//                 Text(
//                   "Welcome Back",
//                   style: theme.textTheme.headlineMedium?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 Text(
//                   "Log in to your EcO-Journey",
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey.shade600,
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 // Email Label
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Email",
//                     style: theme.textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//
//                 // Email Field
//                 TextFormField(
//                   controller: _emailCtrl,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.mail_outline),
//                     hintText: "Enter your email",
//                     filled: true,
//                     fillColor: Colors.grey.shade100,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Email is required';
//                     }
//                     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                     if (!emailRegex.hasMatch(value.trim())) {
//                       return 'Enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Password Label
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Password",
//                     style: theme.textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//
//                 // Password Field
//                 TextFormField(
//                   controller: _passwordCtrl,
//                   obscureText: _obscure,
//                   decoration: InputDecoration(
//                     prefixIcon: const Icon(Icons.lock_outline),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _obscure ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() => _obscure = !_obscure);
//                       },
//                     ),
//                     hintText: "Enter your password",
//                     filled: true,
//                     fillColor: Colors.grey.shade100,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: BorderSide(color: Colors.grey.shade300),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty)
//                       return 'Password is required';
//                     if (value.length < 6)
//                       return 'Password must be at least 6 characters';
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // Forgot password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (ctx) => const ForgotPasswordScreen(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.green.shade600),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: FilledButton(
//                     style: FilledButton.styleFrom(
//                       backgroundColor: Colors.green.shade500,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     onPressed: _isLoading ? null : _onLoginPressed,
//                     child: _isLoading
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Colors.white,
//                             ),
//                           )
//                         : const Text("Login", style: TextStyle(fontSize: 18)),
//                   ),
//                 ),
//
//                 const SizedBox(height: 32),
//
//                 // Divider with text
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(height: 1, color: Colors.grey.shade300),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       child: Text("Or continue with"),
//                     ),
//                     Expanded(
//                       child: Container(height: 1, color: Colors.grey.shade300),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 28),
//
//                 // Google + Apple buttons (placeholders)
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                         ),
//                         onPressed: () {
//                           // TODO: implement Google sign in (use google_sign_in / Firebase OAuth)
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text(
//                                 'Google sign-in not implemented yet',
//                               ),
//                             ),
//                           );
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // ensure these assets exist or replace with Icon
//                             Image.asset('assets/google.png', height: 22),
//                             const SizedBox(width: 8),
//                             const Text("Google"),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                         ),
//                         onPressed: () {
//                           // TODO: implement Apple sign in
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text(
//                                 'Apple sign-in not implemented yet',
//                               ),
//                             ),
//                           );
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('assets/apple.png', height: 22),
//                             const SizedBox(width: 8),
//                             const Text("Apple"),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 30),
//
//                 // Sign Up Redirect
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account?",
//                       style: TextStyle(color: Colors.grey.shade600),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (ctx) => const RegisterScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sustainable_app/auth_screens/forget_password_screen.dart';
import 'package:sustainable_app/auth_screens/register_screen.dart';
import 'package:sustainable_app/dashboards/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<String?> _signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'No account found for that email.';
        case 'wrong-password':
          return 'Incorrect password. Try again.';
        case 'invalid-email':
          return 'That email address is invalid.';
        case 'user-disabled':
          return 'This user has been disabled.';
        case 'too-many-requests':
          return 'Too many attempts. Try again later.';
        default:
          return e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      return 'An error occurred. Please try again.';
    }
  }

  void _onLoginPressed() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;

    final error = await _signIn(email, password);

    if (!mounted) return; // <-- FIX for "use_build_context_synchronously"

    setState(() => _isLoading = false);

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    // Navigate safely after async
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (ctx) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
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

                // Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'Email is required';
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                    hintText: "Enter your password",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password is required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => const ForgotPasswordScreen()),
                      );
                    },
                    child: Text("Forgot Password?", style: TextStyle(color: Colors.green.shade600)),
                  ),
                ),
                const SizedBox(height: 10),

                // Login button
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
                    onPressed: _isLoading ? null : _onLoginPressed,
                    child: _isLoading
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                        : const Text("Login", style: TextStyle(fontSize: 18)),
                  ),
                ),

                const SizedBox(height: 32),

                // Divider
                Row(
                  children: [
                    Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("Or continue with")),
                    Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
                  ],
                ),
                const SizedBox(height: 28),

                // Social buttons (placeholders)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Google sign-in not implemented yet')),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/google.png', height: 22),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Apple sign-in not implemented yet')),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/apple.png', height: 22),
                            const SizedBox(width: 8),
                            const Text("Apple"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.grey.shade600)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => const RegisterScreen()),
                        );
                      },
                      child: const Text("Sign Up", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
