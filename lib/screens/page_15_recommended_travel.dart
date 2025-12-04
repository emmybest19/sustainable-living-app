import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page15RecommendedTravel extends StatelessWidget {
  const Page15RecommendedTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Recommended Eco-Travel'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Eco-Friendly Stays',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Curated list of certified sustainable hotels and lodges for your conscious travel.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // List of Recommended Places
            _RecommendedPlaceCard(
              imageUrl: 'https://example.com/images/eco_resort_1.png',
              name: 'The Canopy Eco-Resort',
              location: 'Costa Rica',
              rating: 4.9,
              tags: const ['Rainforest', 'Solar Powered', 'Local Staff'],
            ),
            _RecommendedPlaceCard(
              imageUrl: 'https://example.com/images/eco_lodge_2.png',
              name: 'Mountain View Lodge',
              location: 'Swiss Alps',
              rating: 4.7,
              tags: const ['Skiing', 'Carbon Neutral', 'Local Food'],
            ),
            _RecommendedPlaceCard(
              imageUrl: 'https://example.com/images/city_hotel_3.png',
              name: 'Urban Green Hotel',
              location: 'Berlin, Germany',
              rating: 4.5,
              tags: const ['City Break', 'Water Recycling', 'Bike Rentals'],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 15 ---

class _RecommendedPlaceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double rating;
  final List<String> tags;

  const _RecommendedPlaceCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(location,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14)),
                    const Spacer(),
                    const Icon(Icons.star, color: Color(0xFFFBC02D), size: 18),
                    const SizedBox(width: 4),
                    Text('$rating',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: tags.map((tag) => _TagChip(tag)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String tag;

  const _TagChip(this.tag);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tag,
        style: TextStyle(color: kMediumGreen, fontSize: 12),
      ),
      backgroundColor: kMediumGreen.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
