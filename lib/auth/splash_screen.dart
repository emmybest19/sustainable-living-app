import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NextPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Logo
            Image.asset(
              'assets/auth/loader.png',
              width: MediaQuery.of(context).size.width * 0.35, // responsive
            ),

            const SizedBox(height: 20),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Sustainable Living Guide',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40, // auto scales with device text settings
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Spacer(flex: 3),

            // Bottom loading bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final percent = (_controller.value * 100).toInt();

                  return Column(
                    children: [
                      LinearProgressIndicator(
                        value: _controller.value,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "$percent %",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome to the next page!",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
