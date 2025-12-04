import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page18RecipeFilter extends StatelessWidget {
  const Page18RecipeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Filter Recipes'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          // 1. Search Bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by ingredient, dish...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Filter Options (Scrollable)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const _FilterSection(
                  title: 'Meal Type',
                  options: ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Dessert'],
                  selected: ['Breakfast'],
                ),
                const _FilterSection(
                  title: 'Dietary Needs',
                  options: ['Vegan', 'Vegetarian', 'Gluten-Free', 'Low-Carb'],
                  selected: ['Vegetarian'],
                ),
                const _FilterSection(
                  title: 'Environmental Impact',
                  options: [
                    'Low Carbon',
                    'Low Waste',
                    'Seasonal',
                    'Locally Sourced'
                  ],
                  selected: ['Low Waste'],
                ),

                // Cooking Time Slider
                const Text('Cooking Time',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const _TimeSlider(),
                const SizedBox(height: 80), // Extra space for the Apply button
              ],
            ),
          ),

          // 3. Apply Button (Fixed at Bottom)
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // Action to apply filter
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kMediumGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Show 128 Recipes',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 18 ---

class _FilterSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String> selected;

  const _FilterSection({
    required this.title,
    required this.options,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: options.map((option) {
              final isSelected = selected.contains(option);
              return Chip(
                label: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                backgroundColor:
                    isSelected ? const Color(0xFF387D6B) : kBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      color: isSelected
                          ? const Color(0xFF387D6B)
                          : Colors.grey.shade200,
                      width: 1),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TimeSlider extends StatefulWidget {
  const _TimeSlider();

  @override
  State<_TimeSlider> createState() => __TimeSliderState();
}

class __TimeSliderState extends State<_TimeSlider> {
  double _currentValue = 60.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('15 min', style: TextStyle(color: Colors.grey)),
            Text('${_currentValue.round()} min',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const Text('120 min', style: TextStyle(color: Colors.grey)),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: kMediumGreen,
            inactiveTrackColor: kBackgroundColor,
            thumbColor: kMediumGreen,
            overlayColor: kMediumGreen.withOpacity(0.2),
            trackHeight: 6.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
          ),
          child: Slider(
            value: _currentValue,
            min: 15,
            max: 120,
            divisions: 21,
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
