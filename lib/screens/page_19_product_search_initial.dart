import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page19ProductSearchInitial extends StatelessWidget {
  const Page19ProductSearchInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Find Eco-Friendly Products'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for sustainable goods...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. Recent Searches
            const Text('Recent Searches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _SearchChip(label: 'Organic cotton tote'),
                _SearchChip(label: 'Glass water bottle'),
                _SearchChip(label: 'Beeswax wraps'),
              ],
            ),
            const SizedBox(height: 30),

            // 3. Popular Searches
            const Text('Popular Searches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _SearchChip(label: 'Zero-Waste Kits', isPopular: true),
                _SearchChip(label: 'Compostable Bags', isPopular: true),
                _SearchChip(label: 'Ethical Fashion', isPopular: true),
              ],
            ),
            const SizedBox(height: 30),

            // 4. Product Grid (Placeholder for quick links/top picks)
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
              children: const [
                _ProductGridItem(
                  imageUrl: 'https://example.com/images/hydro_flask.png',
                  name: 'Hydro Flask',
                  brand: 'Eco Bottle Co.',
                  tag: 'Recycled',
                  tagIcon: Icons.recycling,
                ),
                _ProductGridItem(
                  imageUrl: 'https://example.com/images/shampoo_bar.png',
                  name: 'Shampoo Bar',
                  brand: 'Green Suds',
                  tag: 'Vegan',
                  tagIcon: Icons.spa_outlined,
                ),
                _ProductGridItem(
                  imageUrl: 'https://example.com/images/bamboo_toothbrush.png',
                  name: 'Bamboo Toothbrush',
                  brand: 'Brush Naked',
                  tag: 'Compostable',
                  tagIcon: Icons.compost,
                ),
                _ProductGridItem(
                  imageUrl: 'https://example.com/images/silicone_bags.png',
                  name: 'Silicone Food Bags',
                  brand: 'Stasher',
                  tag: 'Zero-Waste',
                  tagIcon: Icons.sync_alt,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 19 ---

class _SearchChip extends StatelessWidget {
  final String label;
  final bool isPopular;

  const _SearchChip({required this.label, this.isPopular = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isPopular ? Colors.white : Colors.black87,
          fontSize: 14,
        ),
      ),
      backgroundColor: isPopular ? kMediumGreen : kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: isPopular ? BorderSide.none : BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    );
  }
}

class _ProductGridItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String brand;
  final String tag;
  final IconData tagIcon;

  const _ProductGridItem({
    required this.imageUrl,
    required this.name,
    required this.brand,
    required this.tag,
    required this.tagIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  brand,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(tagIcon, color: kMediumGreen, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      tag,
                      style: TextStyle(
                          color: kMediumGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
