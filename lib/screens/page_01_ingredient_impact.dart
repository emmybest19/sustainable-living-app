import 'package:flutter/material.dart';

// --- Placeholder Data & Styles (In a real app, move these to /core/constants/) ---
const Color kHighImpactColor =
    Color(0xFFE57373); // Light red/salmon for high impact
const Color kMediumGreen = Color(0xFF689F38); // Green for positive/seasonal
const Color kBackgroundColor = Color(0xFFF9F9F9); // Light background

// --- Reusable Widget: Impact Tile (For Carbon, Water, Seasonality) ---
class _ImpactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Widget? trailing;
  final Widget? progressBar;

  const _ImpactTile({
    required this.icon,
    required this.title,
    required this.description,
    this.trailing,
    this.progressBar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.black87),
              const SizedBox(width: 8),
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
              if (trailing != null) trailing!,
            ],
          ),
          if (progressBar != null)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: progressBar!,
            ),
        ],
      ),
    );
  }
}

// --- Reusable Widget: Swap Item Card (For Hummus, Edamame) ---
class _SwapItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const _SwapItemCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// --- The Main Screen Widget ---
class Page01IngredientImpact extends StatelessWidget {
  const Page01IngredientImpact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image Header (Avocado)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'data:image/webp;base64,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', // Placeholder URL
                fit: BoxFit.cover,
              ),
            ),

            // 2. Title and Impact Tag
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  const Text(
                    'Avocado',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: kHighImpactColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'High Impact',
                      style: TextStyle(
                          color: kHighImpactColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            // 3. Impact Metrics Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  // Back button and Ingredient Impact Header
                  const Row(
                    children: [
                      BackButton(), // Standard Flutter back button
                      Expanded(
                        child: Text(
                          'Ingredient Impact',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 48), // Space for alignment
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Carbon Footprint Tile
                  _ImpactTile(
                    icon: Icons.fingerprint, // Using a generic icon
                    title: 'Carbon Footprint',
                    description:
                        'Emits a significant amount of CO₂ during production.', // 🌟 FIXED TEXT
                    trailing: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: kMediumGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        '1.5 kg CO₂e / kg', // 🌟 FIXED TEXT (using Unicode ₂)
                        style: TextStyle(
                            color: kMediumGreen, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // No progress bar needed for this metric based on the design
                  ),

                  // Water Usage Tile
                  _ImpactTile(
                    icon: Icons.water_drop,
                    title: 'Water Usage',
                    description:
                        'Requires substantial water, especially in drought-prone growing regions.',
                    progressBar: Stack(
                      children: [
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.7, // Visual representation (70% fill)
                          child: Container(
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(
                                    0xFFFBC02D), // Yellow-orange fill
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(right: 1),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: kMediumGreen,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              '2,000 L / kg',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Seasonality Tile
                  _ImpactTile(
                    icon: Icons.calendar_today_outlined,
                    title: 'Seasonality',
                    description:
                        'Best enjoyed during its peak season to reduce transportation impact.',
                    progressBar: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 1; i <= 12; i++)
                          Tooltip(
                            message: const [
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
                              'May',
                              'Jun',
                              'Jul',
                              'Aug',
                              'Sep',
                              'Oct',
                              'Nov',
                              'Dec'
                            ][i - 1],
                            child: Container(
                              width: 18,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                // Green months for visual representation
                                color: (i >= 2 && i <= 6) || (i >= 8 && i <= 10)
                                    ? kMediumGreen
                                    : Colors.grey.shade300,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 4. Lower Impact Swaps Section
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 20.0, bottom: 16.0),
              child: Text(
                'Lower Impact Swaps',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200, // Height for the horizontal list
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: const [
                  _SwapItemCard(
                    imageUrl:
                        'data:image/jpeg;base64,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',
                    title: 'Hummus',
                    subtitle: 'For a creamy texture',
                  ),
                  _SwapItemCard(
                    imageUrl:
                        'data:image/jpeg;base64,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',
                    title: 'Edamame',
                    subtitle: 'For a nutritious spread',
                  ),
                  _SwapItemCard(
                    imageUrl:
                        'data:image/jpeg;base64,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',
                    title: 'Black Beans',
                    subtitle: 'High protein option',
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
