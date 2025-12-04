import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page13EcoTripPlanner extends StatelessWidget {
  const Page13EcoTripPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Eco-Trip Planner',
          style: TextStyle(color: kMediumGreen, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plan Your Sustainable Journey',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Input your travel details to receive personalized eco-friendly recommendations.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Destination Field
            _InputField(
              label: 'Destination',
              hint: 'e.g., Kyoto, Japan',
              icon: Icons.location_on_outlined,
            ),

            // Dates Fields
            Row(
              children: [
                Expanded(
                  child: _InputField(
                    label: 'Start Date',
                    hint: 'Select Date',
                    icon: Icons.calendar_today_outlined,
                    isReadOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _InputField(
                    label: 'End Date',
                    hint: 'Select Date',
                    icon: Icons.calendar_today_outlined,
                    isReadOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                ),
              ],
            ),

            // Sustainable Transport Selector
            _CategorySelector(
              label: 'Preferred Transport',
              options: const ['Train', 'Bus', 'Bike'],
              icon: Icons.directions_transit_filled,
            ),

            // Accommodation Type
            _CategorySelector(
              label: 'Accommodation Type',
              options: const ['Eco-Lodge', 'Homestay', 'Hotel'],
              icon: Icons.house_outlined,
            ),

            const SizedBox(height: 30),

            // Find Options Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action to find travel options
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMediumGreen,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Find Eco-Friendly Options',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    // Simple date picker placeholder
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
  }
}

// --- Helper Widgets for Page 13 ---

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isReadOnly;
  final VoidCallback? onTap;

  const _InputField({
    required this.label,
    required this.hint,
    required this.icon,
    this.isReadOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: isReadOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon, color: kMediumGreen),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatefulWidget {
  final String label;
  final List<String> options;
  final IconData icon;

  const _CategorySelector({
    required this.label,
    required this.options,
    required this.icon,
  });

  @override
  State<_CategorySelector> createState() => __CategorySelectorState();
}

class __CategorySelectorState extends State<_CategorySelector> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(widget.icon, color: kMediumGreen),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedOption,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                      items:
                          widget.options.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
