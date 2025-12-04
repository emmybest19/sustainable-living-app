import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page24ProductListByCategory extends StatelessWidget {
  const Page24ProductListByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reusable Kitchenware'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to Product Search (Page 19)
              Navigator.pushNamed(context, '/page19');
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Navigate to Product Filter (Page 20)
              Navigator.pushNamed(context, '/page20');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _ProductListTile(
            imageUrl: 'https://example.com/images/bamboo_cutlery.png',
            name: 'Bamboo Cutlery Set',
            description: 'Zero-waste',
            rating: 4.5,
          ),
          _ProductListTile(
            imageUrl: 'https://example.com/images/beeswax_wraps.png',
            name: 'Beeswax Food Wraps',
            description: 'Plastic-free',
            rating: 4.8,
          ),
          _ProductListTile(
            imageUrl: 'https://example.com/images/silicone_lids.png',
            name: 'Silicone Stretch Lids',
            description: 'Reusable',
            rating: 4.6,
          ),
          _ProductListTile(
            imageUrl: 'https://example.com/images/glass_meal_prep.png',
            name: 'Glass Meal Prep Containers',
            description: 'Recycled materials',
            rating: 4.9,
          ),
          _ProductListTile(
            imageUrl: 'https://example.com/images/insulated_steel_bottle.png',
            name: 'Insulated Steel Bottle',
            description: 'Durable',
            rating: 4.7,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 24 ---

class _ProductListTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double rating;

  const _ProductListTile({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                      color: kMediumGreen,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Arrow button
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
