import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page12SustainableTravelTipsList extends StatelessWidget {
  const Page12SustainableTravelTipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sustainable Travel Tips',
          style: TextStyle(color: kMediumGreen, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          // 1. Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: kMediumGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for tips...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: kMediumGreen),
                ),
              ),
            ),
          ),

          // 2. Horizontal Filter Tabs
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _TravelFilterChip(label: 'Before You Go', isSelected: true),
                  _TravelFilterChip(label: 'Getting There', isSelected: false),
                  _TravelFilterChip(label: 'Where to Stay', isSelected: false),
                  _TravelFilterChip(label: 'Activities', isSelected: false),
                ],
              ),
            ),
          ),

          // 3. Tips List (Expansion Tiles)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                _ExpandableTipItem(
                  icon: Icons.water_drop_outlined,
                  title: 'Pack a Reusable Water Bottle',
                  detail:
                      'A single traveler can save an average of 167 plastic bottles/cups per trip by using a reusable bottle. Fill up at airports, restaurants, and local fountains. This reduces plastic waste in local communities that may not have robust recycling infrastructure.',
                ),
                _ExpandableTipItem(
                  icon: Icons.flight_takeoff,
                  title: 'Choose Direct Flights',
                  detail:
                      'Direct flights consume less fuel compared to flights with stopovers, reducing your carbon emissions.',
                ),
                _ExpandableTipItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Support Local Artisans',
                  detail:
                      'Buying local, ethically-made souvenirs directly supports the community and reduces the carbon footprint associated with imported goods.',
                ),
                _ExpandableTipItem(
                  icon: Icons.cloud_outlined,
                  title: 'Offset Your Carbon Footprint',
                  detail:
                      'Invest in certified carbon offset programs to neutralize the environmental impact of your travel.',
                ),
                _ExpandableTipItem(
                  icon: Icons.backpack_outlined,
                  title: 'Pack Light',
                  detail:
                      'Lighter luggage means the plane or train uses less fuel, which reduces emissions.',
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 12 ---

class _TravelFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _TravelFilterChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? kMediumGreen : kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isSelected ? BorderSide.none : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}

class _ExpandableTipItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _ExpandableTipItem({
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kMediumGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kMediumGreen, size: 24),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 72.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Text(
                detail,
                style: const TextStyle(color: Colors.grey, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
