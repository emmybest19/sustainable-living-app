import 'package:flutter/material.dart';

// --- Constants (Use the same constants defined for Page 1) ---
const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page28LogWasteEntry extends StatefulWidget {
  const Page28LogWasteEntry({super.key});

  @override
  State<Page28LogWasteEntry> createState() => _Page28LogWasteEntryState();
}

class _Page28LogWasteEntryState extends State<Page28LogWasteEntry> {
  String _selectedWasteType = 'Plastic';
  String _selectedUnit = 'kg';
  TextEditingController _dateController =
      TextEditingController(text: 'Today, 26 November 2025');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Waste Entry'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Waste Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Waste Type Chips
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    'Plastic',
                    'Paper',
                    'Organic',
                    'Metal',
                    'Glass',
                  ]
                      .map((type) => _WasteTypeChip(
                            label: type,
                            isSelected: _selectedWasteType == type,
                            onSelected: (val) {
                              setState(() {
                                _selectedWasteType = type;
                              });
                            },
                          ))
                      .toList(),
                ),
                const SizedBox(height: 30),

                // Quantity and Unit
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: _WasteInputField(
                              label: 'Quantity',
                              hint: 'e.g., 5',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _UnitDropdown(
                              initialValue: _selectedUnit,
                              units: const ['kg', 'lbs', 'count', 'items'],
                              onChanged: (val) {
                                setState(() {
                                  _selectedUnit = val!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Date Field
                      _WasteDateField(
                        controller: _dateController,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2026),
                          );
                          if (selectedDate != null) {
                            // Update controller text (simplified format for mockup)
                            _dateController.text =
                                'Today, ${selectedDate.day} ${[
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
                              'May',
                              'Jun',
                              'Jul',
                              'Aug',
                              'Sep',
                              'Oct',
                              'Nov',
                              'Dec'
                            ][selectedDate.month - 1]} ${selectedDate.year}';
                          }
                        },
                      ),
                      const SizedBox(height: 20),

                      // Notes
                      const _NotesInputField(),
                    ],
                  ),
                ),
                const SizedBox(height: 100), // Space for fixed button
              ],
            ),
          ),

          // Fixed Save Entry Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Action to save entry
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMediumGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Save Entry',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Helper Widgets for Page 28 ---

class _WasteTypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const _WasteTypeChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: kMediumGreen,
      backgroundColor: kBackgroundColor,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: isSelected
            ? BorderSide.none
            : BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      onSelected: onSelected,
    );
  }
}

class _WasteInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;

  const _WasteInputField({
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
      ],
    );
  }
}

class _UnitDropdown extends StatelessWidget {
  final String initialValue;
  final List<String> units;
  final ValueChanged<String?> onChanged;

  const _UnitDropdown({
    required this.initialValue,
    required this.units,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Unit', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: initialValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: onChanged,
              items: units.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _WasteDateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const _WasteDateField({required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Date', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon:
                const Icon(Icons.calendar_today_outlined, color: kMediumGreen),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
      ],
    );
  }
}

class _NotesInputField extends StatelessWidget {
  const _NotesInputField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Notes (Optional)',
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Add any details...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
