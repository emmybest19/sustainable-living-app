import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page11EnergySavingTipsList extends StatelessWidget {
  const Page11EnergySavingTipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Energy Saving Tips',
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
                  _FilterChip(
                    label: 'All',
                    isSelected: true,
                    color: kMediumGreen,
                  ),
                  _FilterChip(
                    label: 'Lighting',
                    isSelected: false,
                    color: Colors.grey.shade400,
                  ),
                  _FilterChip(
                    label: 'Heating & Cooling',
                    isSelected: false,
                    color: Colors.grey.shade400,
                  ),
                  _FilterChip(
                    label: 'Kitchen',
                    isSelected: false,
                    color: Colors.grey.shade400,
                  ),
                  _FilterChip(
                    label: 'Appliances',
                    isSelected: false,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ),

          // 3. Tips List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _TipListItem(
                  icon: Icons.lightbulb_outline,
                  title: 'Switch to LEDs',
                  description:
                      'Replace traditional bulbs with energy-efficient LEDs.',
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        '/page10',
                      ), // Navigate to Page 10
                ),
                _TipListItem(
                  icon: Icons.thermostat_outlined,
                  title: 'Adjust Your Thermostat',
                  description: 'Lower it in winter and raise it in summer.',
                  onTap: () {},
                ),
                _TipListItem(
                  icon: Icons.flash_off,
                  title: 'Unplug Unused Devices',
                  description: 'Electronics use standby power even when off.',
                  onTap: () {},
                ),
                _TipListItem(
                  icon: Icons.cloud_queue,
                  title: 'Seal Air Leaks',
                  description: 'Check for drafts around windows and doors.',
                  onTap: () {},
                ),
                _TipListItem(
                  icon: Icons.wash_outlined,
                  title: 'Wash Clothes in Cold',
                  description:
                      'Heating water for laundry consumes a lot of energy.',
                  onTap: () {},
                ),
                _TipListItem(
                  icon: Icons.window,
                  title: 'Use Curtains Wisely',
                  description:
                      'Open them for sunlight in winter, close them in summer.',
                  onTap: () {},
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 11 ---

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? kMediumGreen : kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side:
              isSelected ? BorderSide.none : BorderSide(color: color, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}

class _TipListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _TipListItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        subtitle: Text(description, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
