import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page07RecipeDetail extends StatelessWidget {
  const Page07RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image Header
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    'https://example.com/images/avocado_toast.png', // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: BackButton(
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context)),
                  ),
                ),
              ],
            ),

            // 2. Content Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Avocado Toast with a Twist',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'A quick, delicious, and eco-friendly breakfast to kickstart your day.',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // 3. Info Badges (Vegan, Low Carbon, Time)
                  const Row(
                    children: [
                      _RecipeBadge(label: 'Vegan', color: kMediumGreen),
                      _RecipeBadge(label: 'Low Carbon', color: kMediumGreen),
                      _RecipeBadge(
                          label: '10 Mins',
                          icon: Icons.timer,
                          color: Colors.blueGrey),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 4. Environmental Impact
                  const Text('Environmental Impact',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ImpactMetric(
                          icon: Icons.fingerprint, // CO₂
                          value: '0.2 kg',
                          unit: 'CO₂e'),
                      _ImpactMetric(
                          icon: Icons.water_drop, // Water
                          value: '20 L',
                          unit: 'Water'),
                      _ImpactMetric(
                          icon: Icons.local_shipping_outlined, // Food Miles
                          value: '50 mi',
                          unit: 'Food Miles'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 5. Tabs (Ingredients/Instructions)
                  const _RecipeTabs(),
                  const SizedBox(height: 32),

                  // 6. Reviews Section
                  const Text('Reviews (12)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Color(0xFFFBC02D), size: 24),
                      const SizedBox(width: 4),
                      Text('4.8',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const _ReviewTile(
                    name: 'Alex Johnson',
                    comment:
                        'So simple and delicious! The red pepper flakes add the perfect kick. A new breakfast staple for me.',
                    rating: 4.5,
                  ),
                  const _ReviewTile(
                    name: 'Maria Garcia',
                    comment:
                        'Great recipe! I added some cherry tomatoes and everything bagel seasoning. It was fantastic.',
                    rating: 5.0,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.rate_review_outlined),
                      label: const Text('Add a Review'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kMediumGreen,
                        side: BorderSide(color: kMediumGreen),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 7 ---

class _RecipeBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color color;

  const _RecipeBadge({required this.label, required this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  final IconData icon;
  final String value;
  final String unit;

  const _ImpactMetric(
      {required this.icon, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: kMediumGreen, size: 30),
          const SizedBox(height: 4),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class _RecipeTabs extends StatelessWidget {
  const _RecipeTabs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: kMediumGreen,
                unselectedLabelColor: Colors.grey,
                indicatorColor: kMediumGreen,
                tabs: const [
                  Tab(text: 'Ingredients'),
                  Tab(text: 'Instructions'),
                ],
              ),
              const SizedBox(
                height: 250, // Height for the TabBarView content
                child: TabBarView(
                  children: [
                    // Ingredients List
                    _IngredientList(),
                    // Instructions Content
                    Center(
                        child: Text(
                            '1. Toast bread. 2. Mash avocado. 3. Spread mash. 4. Season.')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IngredientList extends StatelessWidget {
  const _IngredientList();

  // Hardcoded ingredients list
  final List<String> ingredients = const [
    '1 ripe avocado',
    '2 slices of sourdough bread',
    '1 tbsp lemon juice',
    'Pinch of red pepper flakes',
    'Salt and pepper to taste',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: false, // Always false for list item
                  onChanged: null,
                  activeColor: kMediumGreen,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  ingredients[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final double rating;

  const _ReviewTile(
      {required this.name, required this.comment, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for User Avatar
          const CircleAvatar(
            radius: 20,
            backgroundImage:
                NetworkImage('https://example.com/images/placeholder_user.png'),
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    _buildStarRating(rating),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment, style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;
    List<Widget> stars = [];

    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Color(0xFFFBC02D), size: 14));
      } else if (i == fullStars && halfStar) {
        stars.add(
            const Icon(Icons.star_half, color: Color(0xFFFBC02D), size: 14));
      } else {
        stars.add(
            Icon(Icons.star_border, color: Colors.grey.shade300, size: 14));
      }
    }
    return Row(children: stars);
  }
}
