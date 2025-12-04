import 'package:flutter/material.dart';

const Color kGreen = Color(0xFF2EA86B);
const Color kSoftGreen = Color(0xFFEFF8F4);
const Color kBackground = Color(0xFFF6F8F6);
const double kRadius = 18.0;

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _CarbonHistoryScreenState();
}

class _CarbonHistoryScreenState extends State<MeScreen> {
  int selectedSegment = 1; // 0=Weekly,1=Monthly,2=Yearly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'My Carbon History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _segmentedControl(),
              const SizedBox(height: 18),

              // Top metric cards
              Row(
                children: const [
                  Expanded(
                    child: _MetricCard(
                      title: 'Average Monthly\nFootprint',
                      value: '345 kg\nCO2e',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _SmallMetricCard(
                      title: 'Change from last\nmonth',
                      value: '↓ 5%',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Big monthly card with placeholder chart
              const _BigChartCard(),

              const SizedBox(height: 20),

              const Text(
                'Category Breakdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Category grid 2x2
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.8,
                children: const [
                  _CategoryCard(
                    icon: Icons.directions_car,
                    label: 'Transport',
                    value: '120 kg',
                    bg: Color(0xFFEAF7FF),
                  ),
                  _CategoryCard(
                    icon: Icons.restaurant,
                    label: 'Food',
                    value: '98 kg',
                    bg: Color(0xFFFFF2EA),
                  ),
                  _CategoryCard(
                    icon: Icons.lightbulb,
                    label: 'Energy',
                    value: '75 kg',
                    bg: Color(0xFFFFF9EA),
                  ),
                  _CategoryCard(
                    icon: Icons.shopping_bag,
                    label: 'Shopping',
                    value: '35 kg',
                    bg: Color(0xFFF6F0FF),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'History Log',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // History list
              Column(
                children: const [
                  _HistoryRow(
                    month: 'June 2024',
                    highest: 'Transport',
                    kg: '328 kg',
                    changePercent: '↓ 5%',
                  ),
                  SizedBox(height: 12),
                  _HistoryRow(
                    month: 'May 2024',
                    highest: 'Food',
                    kg: '345 kg',
                    changePercent: '↑ 2%',
                    increase: true,
                  ),
                  SizedBox(height: 12),
                  _HistoryRow(
                    month: 'April 2024',
                    highest: 'Transport',
                    kg: '338 kg',
                    changePercent: '↓ 8%',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _segmentedControl() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2EA),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(3, (i) {
          final labels = ['Weekly', 'Monthly', 'Yearly'];
          final isSelected = selectedSegment == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedSegment = i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Text(
                    labels[i],
                    style: TextStyle(
                      color: isSelected ? kGreen : Colors.black54,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/// Metric card (big)
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;

  const _MetricCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

/// Small right metric
class _SmallMetricCard extends StatelessWidget {
  final String title;
  final String value;

  const _SmallMetricCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: kGreen,
            ),
          ),
        ],
      ),
    );
  }
}

/// Big chart card (placeholder for pill-shaped monthly bubbles)
class _BigChartCard extends StatelessWidget {
  const _BigChartCard();

  Widget _pill(double width) {
    return Container(
      width: width,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6F1),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Monthly Footprint',
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '328 kg',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('This Month', style: TextStyle(color: Colors.black45)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(''),
                  SizedBox(height: 8),
                  Text(
                    '↓ 5%',
                    style: TextStyle(
                      color: kGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Placeholder "chart" (row of pill blobs)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_pill(120), _pill(90), _pill(110)],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Jan', style: TextStyle(color: Colors.black54)),
                    Text('Mar', style: TextStyle(color: Colors.black54)),
                    Text('May', style: TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('Feb', style: TextStyle(color: Colors.black54)),
                    Text('Apr', style: TextStyle(color: Colors.black54)),
                    Text('Jun', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Small category card
class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color bg;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: bg,
            child: Icon(icon, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(value, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// History row widget
class _HistoryRow extends StatelessWidget {
  final String month;
  final String highest;
  final String kg;
  final String changePercent;
  final bool increase;

  const _HistoryRow({
    required this.month,
    required this.highest,
    required this.kg,
    required this.changePercent,
    this.increase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFEAF2EA),
            child: const Icon(Icons.calendar_today, color: kGreen),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  'Highest: $highest',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                kg,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                changePercent,
                style: TextStyle(color: increase ? Colors.red : kGreen),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
