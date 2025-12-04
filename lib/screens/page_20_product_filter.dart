import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page20ProductFilter extends StatelessWidget {
  const Page20ProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Filters'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Reset',
                style: TextStyle(color: kMediumGreen, fontSize: 16)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: const [
                // 1. Category
                Text('Category',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                _CategoryFilterChips(
                  options: [
                    'Home & Kitchen',
                    'Personal Care',
                    'Fashion',
                    'Electronics'
                  ],
                  selected: ['Home & Kitchen'],
                ),
                SizedBox(height: 24),

                // 2. Price Range
                Text('Price Range',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                _PriceRangeSlider(),
                SizedBox(height: 24),

                // 3. Brand
                _FilterTextTile(title: 'Brand', hint: 'e.g., Patagonia'),

                // 4. Certifications
                _FilterTextTile(
                    title: 'Certifications', hint: 'e.g., B Corp, Fair Trade'),

                // 5. Rating
                _RatingFilter(),
                SizedBox(height: 40),
              ],
            ),
          ),

          // Apply Button
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
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kMediumGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 20 ---

class _CategoryFilterChips extends StatelessWidget {
  final List<String> options;
  final List<String> selected;

  const _CategoryFilterChips({required this.options, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: options.map((option) {
        final isSelected = selected.contains(option);
        return Chip(
          label: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          backgroundColor: isSelected ? kMediumGreen : kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
                color: isSelected ? kMediumGreen : Colors.grey.shade300,
                width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        );
      }).toList(),
    );
  }
}

class _PriceRangeSlider extends StatefulWidget {
  const _PriceRangeSlider();

  @override
  State<_PriceRangeSlider> createState() => __PriceRangeSliderState();
}

class __PriceRangeSliderState extends State<_PriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(50, 300);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 500,
          divisions: 100,
          activeColor: kMediumGreen,
          inactiveColor: kBackgroundColor,
          labels: RangeLabels(
            '\$${_currentRangeValues.start.round()}',
            '\$${_currentRangeValues.end.round()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${_currentRangeValues.start.round()}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('\$${_currentRangeValues.end.round()}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class _FilterTextTile extends StatelessWidget {
  final String title;
  final String hint;

  const _FilterTextTile({required this.title, required this.hint});

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
          Container(
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingFilter extends StatelessWidget {
  const _RatingFilter();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          children: List.generate(5, (index) {
            // Placeholder: Assume 3 stars selected
            return Icon(
              index < 3 ? Icons.star : Icons.star_border,
              color: index < 3 ? Colors.amber : Colors.grey,
              size: 36,
            );
          }),
        ),
      ],
    );
  }
}
