import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kRedImpact = Color(0xFFD32F2F);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page27LowImpactSwapsDetail extends StatelessWidget {
  const Page27LowImpactSwapsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        // The title is part of the content, not the AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image
            Image.network(
              'https://example.com/images/avocado.png',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // 2. Title and High Impact Tag
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avocado',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: kRedImpact.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'High Impact',
                      style: TextStyle(
                          color: kRedImpact,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 3. Impact Metrics
                  const _ImpactMetric(
                    icon: Icons.cloud_outlined,
                    title: 'Carbon Footprint',
                    value: '1.5 kg CO₂e / kg',
                    detail:
                        'Emits a significant amount of CO₂e during cultivation and long-distance transport.',
                  ),
                  const _ImpactMetric(
                    icon: Icons.opacity,
                    title: 'Water Usage',
                    value: '2,000 L / kg',
                    detail:
                        'Requires substantial water, especially in drought-prone growing regions.',
                  ),
                  const _ImpactMetric(
                    icon: Icons.calendar_today_outlined,
                    title: 'Seasonality',
                    value:
                        'Jan, Feb, Mar, Apr', // Simplified visual placeholder
                    detail:
                        'Best enjoyed during its peak season to reduce transportation impact.',
                  ),
                ],
              ),
            ),

            // 4. Low Impact Swaps
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Text(
                'Lower Impact Swaps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200, // Height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  _SwapCard(
                    imageUrl: 'https://example.com/images/hummus.png',
                    name: 'Hummus',
                    reason: 'For a creamy texture',
                  ),
                  _SwapCard(
                    imageUrl: 'https://example.com/images/edamame.png',
                    name: 'Edamame',
                    reason: 'For a nutritious spread',
                  ),
                  _SwapCard(
                    imageUrl: 'https://example.com/images/peanut_butter.png',
                    name: 'Nut Butter',
                    reason: 'High protein option',
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

// --- Helper Widgets for Page 27 ---

class _ImpactMetric extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String detail;

  const _ImpactMetric({
    required this.icon,
    required this.title,
    required this.value,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: kMediumGreen, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kMediumGreen),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            detail,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _SwapCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String reason;

  const _SwapCard({
    required this.imageUrl,
    required this.name,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  reason,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
