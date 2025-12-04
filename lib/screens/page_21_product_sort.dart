import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page21ProductSort extends StatelessWidget {
  const Page21ProductSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sort by'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: const [
                _SortOptionTile(label: 'Relevance', isSelected: true),
                _SortOptionTile(label: 'Popularity'),
                _SortOptionTile(label: 'Rating'),
                _SortOptionTile(label: 'New Arrivals'),
                _SortOptionTile(label: 'Price: Low to High'),
                _SortOptionTile(label: 'Price: High to Low'),
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
                backgroundColor:
                    const Color(0xFF4C7567), // Darker green from screenshot
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 21 ---

class _SortOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _SortOptionTile({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? kMediumGreen.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelected ? kMediumGreen : Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.circle, color: kMediumGreen, size: 18)
            : Icon(Icons.radio_button_off,
                color: Colors.grey.shade400, size: 18),
        onTap: () {
          // Typically handled by a parent stateful widget (or BLoC/Provider)
        },
      ),
    );
  }
}
