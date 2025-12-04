import 'package:flutter/material.dart';

// --- Placeholder Styles ---
const Color kPrimaryGreen = Color(0xFF4C8C4A);
const Color kLightChip = Color(0xFFDCEADF); // Very light green for chips

// --- Reusable Widget: Filter Section Title ---
class _FilterSectionTitle extends StatelessWidget {
  final String title;

  const _FilterSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// --- The Main Screen Widget ---
class Page06ProductFilters extends StatefulWidget {
  const Page06ProductFilters({super.key});

  @override
  State<Page06ProductFilters> createState() => _Page06ProductFiltersState();
}

class _Page06ProductFiltersState extends State<Page06ProductFilters> {
  // State variables for the filters
  String _selectedCategory = 'Home & Kitchen';
  RangeValues _priceRange = const RangeValues(50, 300);
  double _rating = 0.0;

  final List<String> _categories = [
    'Home & Kitchen',
    'Personal Care',
    'Fashion',
    'Electronics'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Filters'),
        actions: [
          TextButton(
            onPressed: () {
              // Action to reset all filters
              setState(() {
                _selectedCategory = 'Home & Kitchen';
                _priceRange = const RangeValues(50, 300);
                _rating = 0.0;
              });
            },
            child: const Text('Reset',
                style: TextStyle(
                    color: kPrimaryGreen, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Scrollable Filter Options
          ListView(
            padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 100), // Space for button
            children: [
              // 1. Category
              const _FilterSectionTitle(title: 'Category'),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return ActionChip(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    label: Text(category),
                    backgroundColor: isSelected ? kLightChip : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color:
                            isSelected ? kPrimaryGreen : Colors.grey.shade300,
                      ),
                    ),
                    labelStyle: TextStyle(
                        color: isSelected ? kPrimaryGreen : Colors.black87),
                  );
                }).toList(),
              ),

              // 2. Price Range Slider
              const _FilterSectionTitle(title: 'Price Range'),
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: 500,
                divisions: 50,
                activeColor: kPrimaryGreen,
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _priceRange = newValues;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${_priceRange.start.round()}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${_priceRange.end.round()}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              // 3. Brand & Certifications (Placeholder TextFields)
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Brand',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Certifications',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

              // 4. Rating
              const _FilterSectionTitle(title: 'Rating'),
              Row(
                children: [
                  // Star Rating display
                  ...List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                    );
                  }),
                ],
              ),
            ],
          ),

          // Persistent "Apply" Button (same style as Page 3)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Action to apply filters
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
