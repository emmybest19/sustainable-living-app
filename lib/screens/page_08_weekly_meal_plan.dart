import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page08WeeklyMealPlan extends StatelessWidget {
  const Page08WeeklyMealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weekly Meal Plan'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Date Navigation Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: kMediumGreen),
                      onPressed: () {},
                    ),
                    const Text(
                      'Oct 21 - Oct 27',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.chevron_right, color: kMediumGreen),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 2. Meal Plan Accordions
            const _DailyMealAccordion(day: 'Monday, Oct 21', isExpanded: true),
            const _DailyMealAccordion(day: 'Tuesday, Oct 22'),
            const _DailyMealAccordion(day: 'Wednesday, Oct 23'),
            const _DailyMealAccordion(day: 'Thursday, Oct 24'),
            const _DailyMealAccordion(day: 'Friday, Oct 25'),
            const _DailyMealAccordion(day: 'Saturday, Oct 26'),
            const _DailyMealAccordion(day: 'Sunday, Oct 27'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 8 ---

class _DailyMealAccordion extends StatefulWidget {
  final String day;
  final bool isExpanded;

  const _DailyMealAccordion({required this.day, this.isExpanded = false});

  @override
  State<_DailyMealAccordion> createState() => __DailyMealAccordionState();
}

class __DailyMealAccordionState extends State<_DailyMealAccordion> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.isExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(
            widget.day,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          trailing: Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  const _MealItem(
                    type: 'Breakfast',
                    name: 'Berry Oat Bowl',
                    imageUrl: 'https://example.com/images/oat_bowl.png',
                  ),
                  const _MealItem(
                    type: 'Lunch',
                    name: 'Avocado Toast',
                    imageUrl:
                        'https://example.com/images/avocado_toast_small.png',
                  ),
                  _AddMealButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealItem extends StatelessWidget {
  final String type;
  final String name;
  final String imageUrl;

  const _MealItem(
      {required this.type, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddMealButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: kMediumGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add, color: kMediumGreen, size: 28),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '+ Add Dinner',
              style: TextStyle(
                color: kMediumGreen,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
