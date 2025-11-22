import 'package:flutter/material.dart';

import 'package:sustainable_app/util/feature_tile.dart';
import 'package:sustainable_app/auth/register_screen.dart';
import 'package:sustainable_app/auth/login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() {
    return _CreateAccountScreenState();
  }
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top Image Section
            SliverToBoxAdapter(
              child: ClipRRect(
                // borderRadius: const BorderRadius.only(
                //   bottomLeft: Radius.circular(40),
                //   bottomRight: Radius.circular(40),
                // ),
                child: Image.asset(
                  'assets/auth/create.png', // change to your asset
                  height: height * 0.32,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text / Feature Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Live a Greener Life',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your personal guide to a more sustainable future. Track your impact, discover eco-friendly tips, and join a community making a difference.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),

                    FeatureTile(
                      icon: Icons.south_america_rounded,
                      title: 'Track Your Impact',
                      description:
                      'Monitor your carbon footprint and resource usage.',
                    ),
                    const SizedBox(height: 20),

                    FeatureTile(
                      icon: Icons.eco_rounded,
                      title: 'Live Sustainably',
                      description:
                      'Find guides and challenges for sustainable living.',
                    ),
                    const SizedBox(height: 20),

                    FeatureTile(
                      icon: Icons.group_rounded,
                      title: 'Join a Community',
                      description:
                      'Connect with others and share your progress.',
                    ),

                    const SizedBox(height: 40),

                    // Create account button
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Create an Account',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 6),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (ctx) => LoginScreen()));
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
