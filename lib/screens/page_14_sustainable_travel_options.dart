import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page14SustainableTravelOptions extends StatelessWidget {
  const Page14SustainableTravelOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Sustainable Travel Options'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Your Eco-Friendly Guide',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Discover low-impact transportation and accommodation alternatives for your trip.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 24),

            // Getting There Section
            _TravelCategorySection(
              title: 'Getting There (Long-Distance)',
              icon: Icons.flight_takeoff,
              items: [
                _OptionTile(
                  title: 'High-Speed Rail',
                  detail: 'Offers up to 90% lower CO₂ emissions than flying.',
                  impact: 'Low Carbon',
                ),
                _OptionTile(
                  title: 'Long-Haul Bus',
                  detail: 'Economical and reduces individual car dependency.',
                  impact: 'Budget Friendly',
                ),
              ],
            ),

            // Getting Around Town Section
            _TravelCategorySection(
              title: 'Getting Around Town',
              icon: Icons.directions_walk,
              items: [
                _OptionTile(
                  title: 'Bicycle Rentals',
                  detail: 'Explore cities with zero emissions and stay active.',
                  impact: 'Zero Emission',
                ),
                _OptionTile(
                  title: 'Local Public Transit',
                  detail:
                      'Reduces traffic congestion and emissions from private vehicles.',
                  impact: 'Community Focused',
                ),
              ],
            ),

            // Accommodation Section
            _TravelCategorySection(
              title: 'Accommodation',
              icon: Icons.hotel_outlined,
              items: [
                _OptionTile(
                  title: 'Certified Eco-Lodge',
                  detail:
                      'Uses renewable energy and practices water conservation.',
                  impact: 'High Sustainability',
                ),
                _OptionTile(
                  title: 'Homestays/Locally Owned',
                  detail:
                      'Ensures tourist money directly supports the local economy.',
                  impact: 'Local Economy',
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 14 ---

class _TravelCategorySection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_OptionTile> items;

  const _TravelCategorySection({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: kMediumGreen, size: 28),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 20),
          ...items,
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String title;
  final String detail;
  final String impact;

  const _OptionTile({
    required this.title,
    required this.detail,
    required this.impact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kMediumGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  impact,
                  style: TextStyle(
                    color: kMediumGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            detail,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: kMediumGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
