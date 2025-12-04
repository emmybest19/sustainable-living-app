import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kLightGreen = Color(0xFFE8F5E9);
const Color kAccentGreen = Color(0xFF4CAF50); // Lighter shade for buttons
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page26RecommendedProductsCarousel extends StatelessWidget {
  const Page26RecommendedProductsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Recommended For You'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Text
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Based on your interest in \'Zero-Waste Kitchen\'',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),

          // Filter Chips
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _FilterChip(label: 'All', isSelected: true),
                  _FilterChip(label: 'Kitchen', isSelected: true),
                  _FilterChip(label: 'Personal Care'),
                  _FilterChip(label: 'Home'),
                  _FilterChip(label: 'Travel'),
                ],
              ),
            ),
          ),

          // Product Feed
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                _RecommendedProductCard(
                  imageUrl:
                      'https://example.com/images/beeswax_wraps_large.png',
                  name: 'Reusable Beeswax Food Wraps',
                  category: 'Plastic-Free Food Storage',
                  subCategory: 'Kitchen',
                ),
                _RecommendedProductCard(
                  imageUrl:
                      'https://example.com/images/bamboo_toothbrush_set_large.png',
                  name: 'Bamboo Toothbrush Set',
                  category: 'Biodegradable Dental Care',
                  subCategory: 'Personal Care',
                  isNew: true,
                ),
                _RecommendedProductCard(
                  imageUrl:
                      'https://example.com/images/wool_dryer_balls_large.png',
                  name: 'Wool Dryer Balls',
                  category: 'Natural Fabric Softener',
                  subCategory: 'Home',
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 26 ---

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? kMediumGreen : kLightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isSelected ? BorderSide.none : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}

class _RecommendedProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final String subCategory;
  final bool isNew;

  const _RecommendedProductCard({
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.subCategory,
    this.isNew = false,
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
              height: 200,
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
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  subCategory,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Product Detail (Page 23)
                      Navigator.pushNamed(context, '/page23');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccentGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('View Details',
                        style: TextStyle(color: Colors.white)),
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
