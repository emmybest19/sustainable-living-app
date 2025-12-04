import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page25ProductCategories extends StatelessWidget {
  const Page25ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Categories'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          // 1. Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search categories',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Categories Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              childAspectRatio: 0.9,
              children: const [
                _CategoryTile(
                  title: 'Home & Kitchen',
                  imageUrl: 'https://example.com/images/home_kitchen.png',
                  route: '/page24', // Example link to a product list
                ),
                _CategoryTile(
                  title: 'Personal Care',
                  imageUrl: 'https://example.com/images/personal_care.png',
                ),
                _CategoryTile(
                  title: 'Fashion & Apparel',
                  imageUrl: 'https://example.com/images/fashion_apparel.png',
                ),
                _CategoryTile(
                  title: 'Cleaning Supplies',
                  imageUrl: 'https://example.com/images/cleaning_supplies.png',
                ),
                _CategoryTile(
                  title: 'Kids & Baby',
                  imageUrl: 'https://example.com/images/kids_baby.png',
                ),
                _CategoryTile(
                  title: 'Office & Stationery',
                  imageUrl: 'https://example.com/images/office_stationery.png',
                ),
                _CategoryTile(
                  title: 'Outdoor & Travel',
                  imageUrl: 'https://example.com/images/outdoor_travel.png',
                ),
                _CategoryTile(
                  title: 'Electronics',
                  imageUrl: 'https://example.com/images/electronics.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 25 ---

class _CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? route;

  const _CategoryTile({
    required this.title,
    required this.imageUrl,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route!);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
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
            // Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
