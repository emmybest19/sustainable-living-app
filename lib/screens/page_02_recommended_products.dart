import 'package:flutter/material.dart';

// --- Placeholder Styles ---
const Color kPrimaryGreen = Color(0xFF4C8C4A); // A rich green color
const Color kLightGreen = Color(0xFFE8F5E9); // Very light background green

// --- Reusable Widget: Product Category Chip ---
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? kLightGreen : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? kPrimaryGreen : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? kPrimaryGreen : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

// --- Reusable Widget: Recommended Product Card ---
class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const _ProductCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Text and Button Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // View Details Button
                ElevatedButton(
                  onPressed: () {
                    // Action for View Details
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  child: const Text('View Details',
                      style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- The Main Screen Widget ---
class Page02RecommendedProducts extends StatefulWidget {
  const Page02RecommendedProducts({super.key});

  @override
  State<Page02RecommendedProducts> createState() =>
      _Page02RecommendedProductsState();
}

class _Page02RecommendedProductsState extends State<Page02RecommendedProducts> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Kitchen',
    'Personal Care',
    'Home',
    'Fashion',
    'Electronics'
  ];

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    // In a real app, this would trigger data filtering
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We will rely on the main.dart AppBar for the back button and title
      appBar: AppBar(
        // Note: If you want this screen to be a standalone route (not in the PageHost),
        // you would uncomment the leading and title properties below:
        /*
        leading: const BackButton(), 
        title: const Text('Recommended For You'),
        */
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Based on your interest in 'Zero-Waste Kitchen'",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal Category Filter Tabs
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return _CategoryChip(
                  label: category,
                  isSelected: _selectedCategory == category,
                  onTap: () => _onCategorySelected(category),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Recommended Products List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                _ProductCard(
                  imageUrl: 'https://example.com/images/beeswax.png',
                  title: 'Reusable Beeswax Food Wraps',
                  subtitle: 'Plastic-Free Food Storage\nKitchen',
                ),
                _ProductCard(
                  imageUrl: 'https://example.com/images/toothbrush.png',
                  title: 'Bamboo Toothbrush Set',
                  subtitle: 'Biodegradable Dental Care\nPersonal Care',
                ),
                _ProductCard(
                  imageUrl: 'https://example.com/images/dryerballs.png',
                  title: 'Wool Dryer Balls',
                  subtitle: 'Natural Fabric Softener\nHome',
                ),
                // Add more product cards here...
              ],
            ),
          ),
        ],
      ),
    );
  }
}
