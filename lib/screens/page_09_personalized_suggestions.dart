import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page09PersonalizedSuggestions extends StatelessWidget {
  const Page09PersonalizedSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        // The AppBar background in the screenshot appears dark green/teal
        backgroundColor: const Color(0xFF387D6B),
        title: const Text(
          'Personalized Suggestions',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header/Banner
            Container(
              color: const Color(0xFF387D6B),
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: kMediumGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: kMediumGreen, width: 2),
                    ),
                    child: const Icon(Icons.lightbulb_outline,
                        color: kMediumGreen, size: 40),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Custom Energy Plan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Based on your home profile, here are some tips just for you.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // 2. List of Suggestions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  _SuggestionCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Upgrade to LED Lighting',
                    description:
                        'Switching your most-used bulbs could save you X% on lighting costs.',
                  ),
                  _SuggestionCard(
                    icon: Icons.thermostat_outlined,
                    title: 'Adjust Your Thermostat',
                    description:
                        'Lowering it by just a few degrees in winter makes a big difference.',
                  ),
                  _SuggestionCard(
                    icon: Icons.flash_off,
                    title: 'Unplug \'Vampire\' Electronics',
                    description:
                        'Devices on standby still draw power. Unplug them when not in use.',
                  ),
                  _SuggestionCard(
                    icon: Icons.cloud_queue,
                    title: 'Seal Air Leaks',
                    description:
                        'Check for drafts around windows and doors to keep heated or cooled air in.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 9 ---

class _SuggestionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _SuggestionCard(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kMediumGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: kMediumGreen, size: 24),
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
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          // Learn More Button
          TextButton(
            onPressed: () {},
            child: Text('Learn More',
                style: TextStyle(color: kMediumGreen, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
