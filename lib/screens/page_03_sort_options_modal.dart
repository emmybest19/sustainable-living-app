import 'package:flutter/material.dart';

// --- Placeholder Styles ---
const Color kPrimaryGreen = Color(0xFF4C8C4A); // A rich green color
const Color kLightGreen = Color(0xFFE8F5E9); // Very light background green

enum SortOption {
  relevance,
  popularity,
  rating,
  newArrivals,
  priceLowToHigh,
  priceHighToLow,
}

// --- Reusable Widget: Custom Radio Tile (For all sorting options) ---
class _SortOptionTile extends StatelessWidget {
  final String title;
  final SortOption value;
  final SortOption groupValue;
  final ValueChanged<SortOption> onChanged;
  final bool isFirst;
  final bool isLast;

  const _SortOptionTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? kLightGreen.withOpacity(0.5) : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected
                ? kPrimaryGreen.withOpacity(0.7)
                : Colors.grey.shade300,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
              Radio<SortOption>(
                value: value,
                groupValue: groupValue,
                onChanged: (SortOption? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                },
                activeColor: kPrimaryGreen,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return kPrimaryGreen;
                  }
                  return Colors.grey;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- The Main Screen Widget ---
class Page03SortOptionsModal extends StatefulWidget {
  const Page03SortOptionsModal({super.key});

  @override
  State<Page03SortOptionsModal> createState() => _Page03SortOptionsModalState();
}

class _Page03SortOptionsModalState extends State<Page03SortOptionsModal> {
  SortOption _selectedSortOption = SortOption.relevance;

  void _handleSortChange(SortOption? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedSortOption = newValue;
      });
    }
  }

  void _applySort() {
    // In a real app, this would apply the filter and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Applied Sort: ${_selectedSortOption.name}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Sort by'),
      ),
      body: Stack(
        children: [
          // Scrollable list of sort options
          ListView(
            padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 100), // Reserve space for the Apply button
            children: [
              _SortOptionTile(
                title: 'Relevance',
                value: SortOption.relevance,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
                isFirst: true,
              ),
              _SortOptionTile(
                title: 'Popularity',
                value: SortOption.popularity,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
              ),
              _SortOptionTile(
                title: 'Rating',
                value: SortOption.rating,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
              ),
              _SortOptionTile(
                title: 'New Arrivals',
                value: SortOption.newArrivals,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
              ),
              _SortOptionTile(
                title: 'Price: Low to High',
                value: SortOption.priceLowToHigh,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
              ),
              _SortOptionTile(
                title: 'Price: High to Low',
                value: SortOption.priceHighToLow,
                groupValue: _selectedSortOption,
                onChanged: _handleSortChange,
                isLast: true,
              ),
            ],
          ),

          // Persistent "Apply" Button at the bottom
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
                  onPressed: _applySort,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Apply',
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
