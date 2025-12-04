import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38); 
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page23ProductDetailBambooToothbrush extends StatelessWidget {
  const Page23ProductDetailBambooToothbrush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bamboo Toothbrush'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Space for button
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Image Carousel (Simulated)
                _ProductImageGallery(
                  imageUrl: 'https://example.com/images/bamboo_toothbrush_hero.png',
                ),
                
                // 2. Product Info
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('EcoSmile Co.', style: TextStyle(color: Colors.grey, fontSize: 16)),
                      SizedBox(height: 4),
                      Text(
                        'Bamboo Toothbrush',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      
                      // Description
                      _ExpandableSection(
                        title: 'Description',
                        content:
                            'Make a simple switch with a big impact. Our Bamboo Toothbrush is made from 100% biodegradable, sustainably-grown Moso bamboo. The handle provides a natural, non-slip grip and the BPA-free nylon bristles are infused with charcoal for enhanced cleaning. It\'s the perfect alternative to plastic toothbrushes that pollute our oceans and landfills.',
                        isExpanded: true,
                      ),
                      
                      // Why It's Eco-Friendly
                      _ExpandableSection(
                        title: 'Why It\'s Eco-Friendly',
                        content: 'Biodegradable handle, BPA-free bristles, sustainable sourcing, and minimal plastic packaging. Contributes to a zero-waste lifestyle.',
                      ),

                      // Materials & Ingredients
                      _ExpandableSection(
                        title: 'Materials & Ingredients',
                        content: 'Handle: Moso Bamboo. Bristles: Charcoal-infused BPA-free Nylon 6 (for hygiene, alternative materials are under development).',
                      ),
                      
                      // User Reviews (Placeholder, would typically navigate to a full review list)
                      _ExpandableSection(
                        title: 'User Reviews',
                        content: 'Average Rating: 4.8 stars based on 1,200 reviews.',
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 3. Floating Buy Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text('Where to Buy', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMediumGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 23 ---

class _ProductImageGallery extends StatelessWidget {
  final String imageUrl;

  const _ProductImageGallery({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        // Simple dots for gallery indicator
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? kMediumGreen : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpandableSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;

  const _ExpandableSection({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        initiallyExpanded: isExpanded,
        iconColor: kMediumGreen,
        collapsedIconColor: kMediumGreen,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}