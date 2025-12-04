import 'package:flutter/material.dart';

// --- Placeholder Styles & Data ---
const Color kPrimaryGreen = Color(0xFF4C8C4A); // A rich green color

class Recipe {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;

  const Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });
}

const List<Recipe> dummyRecipes = [
  Recipe(
    title: 'Hearty Lentil Soup',
    description:
        'A nourishing and warming soup that uses seasonal vegetables and minimizes food waste.',
    imageUrl: 'https://example.com/images/lentil_soup.png',
    tags: ['Vegan', 'Low Waste', 'Seasonal'],
  ),
  Recipe(
    title: 'Vibrant Quinoa Salad',
    description:
        'A colorful and nutritious salad perfect for a light lunch, packed with plant-based protein.',
    imageUrl: 'https://example.com/images/quinoa_salad.png',
    tags: ['Vegetarian', 'Low-Carbon'],
  ),
  Recipe(
    title: 'Seasonal Root Vegetable Roast',
    description:
        'Simple, delicious, and eco-friendly. Make the most of what’s in season with this versatile dish.',
    imageUrl: 'https://example.com/images/root_vegetable_roast.png',
    tags: ['Vegan', 'Seasonal', 'Gluten-Free'],
  ),
  Recipe(
    title: 'Zero-Waste Overnight Oats',
    description:
        'An easy, no-cook breakfast that helps use up leftover fruits and nuts, reducing food waste.',
    imageUrl: 'https://example.com/images/overnight_oats.png',
    tags: ['Vegetarian', 'Low Waste'],
  ),
];

// --- Reusable Widget: Recipe Tag Chip ---
class _RecipeTag extends StatelessWidget {
  final String label;

  const _RecipeTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: kPrimaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: kPrimaryGreen,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// --- Reusable Widget: Recipe Card ---
class _RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  recipe.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  recipe.description,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),
                const SizedBox(height: 12),
                // Tags
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children:
                      recipe.tags.map((tag) => _RecipeTag(label: tag)).toList(),
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
class Page04RecipesList extends StatelessWidget {
  const Page04RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Sustainable Recipes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          return _RecipeCard(recipe: dummyRecipes[index]);
        },
      ),
    );
  }
}
