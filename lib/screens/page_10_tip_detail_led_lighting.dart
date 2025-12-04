import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page10TipDetailLEDLighting extends StatelessWidget {
  const Page10TipDetailLEDLighting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image Header
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDgBT_8Z2-rvTyDSWZgS4n9mET5Jb_ASwIbQ&s',
                      ), // Placeholder
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Custom AppBar/Title Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: BackButton(
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: const Text(
                      'Switch to LED Lighting',
                      style: TextStyle(
                        color: kMediumGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. What & Why
                  const Text(
                    'The What & Why',
                    style: TextStyle(
                      color: kMediumGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Switching to LED (Light Emitting Diode) bulbs is one of the simplest and most effective ways to reduce your energy consumption. Unlike traditional incandescent bulbs, LEDs convert most of their energy into light rather than heat, making them significantly more efficient and longer-lasting.',
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  // 3. Key Benefits
                  const Text(
                    'Key Benefits',
                    style: TextStyle(
                      color: kMediumGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _BenefitTile(
                    icon: Icons.attach_money,
                    title: 'Saves Money',
                    description:
                        'LEDs use up to 85% less energy, lowering your electricity bills.',
                  ),
                  const _BenefitTile(
                    icon: Icons.fingerprint,
                    title: 'Reduces Carbon Footprint',
                    description:
                        'Less energy consumption means fewer greenhouse gas emissions.',
                  ),
                  const _BenefitTile(
                    icon: Icons.watch_later_outlined,
                    title: 'Longer Lifespan',
                    description:
                        'LEDs can last up to 25 times longer than traditional bulbs.',
                  ),
                  const SizedBox(height: 32),

                  // 4. How-To Steps
                  const Text(
                    'How-To Steps',
                    style: TextStyle(
                      color: kMediumGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _StepTile(
                    stepNumber: 1,
                    title: 'Identify Your Bulbs',
                    description:
                        'Check the base type (e.g., E26, GU10) and brightness (lumens) of your current bulbs.',
                  ),
                  const _StepTile(
                    stepNumber: 2,
                    title: 'Choose the Right Color',
                    description:
                        'Select a color temperature (Kelvin). \'Warm White\' is cozy, while \'Cool White\' is energizing.',
                  ),
                  const _StepTile(
                    stepNumber: 3,
                    title: 'Replace and Recycle',
                    description:
                        'Swap out old bulbs with new LEDs. Dispose of old ones responsibly at a recycling facility.',
                  ),
                  const SizedBox(height: 32),

                  // 5. Did You Know? Box
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kMediumGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lightbulb_outline,
                          color: kMediumGreen,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Did You Know?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kMediumGreen,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'If every U.S. household replaced just one incandescent bulb with an LED, we would save enough energy to power more than 3 million homes for a year.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 10 ---

class _BenefitTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _BenefitTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kMediumGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: kMediumGreen, size: 20),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String description;

  const _StepTile({
    required this.stepNumber,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step Number Circle
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kMediumGreen,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$stepNumber',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
