import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Clear All",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  _FilterGroup(
                    title: "Specialities",
                    options: {
                      "Urology": 21,
                      "Psychiatry": 21,
                      "Cardiology": 21,
                      "Pediatrics": 21,
                      "Neurology": 21,
                      "Pulmonology": 21,
                    },
                  ),
                  _FilterGroup(
                    title: "Consultation type",
                    options: {
                      "Audio Call": 0,
                      "Video Call": 0,
                      "Instant Counseling": 0,
                      "Chat": 0,
                    },
                  ),
                  _FilterGroup(
                    title: "Gender",
                    options: {"Male": 21, "Female": 21},
                  ),
                  _PricingFilter(),
                  // Add more filters as needed (Languages, Experience, etc.)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterGroup extends StatefulWidget {
  final String title;
  final Map<String, int> options;

  const _FilterGroup({required this.title, required this.options});

  @override
  State<_FilterGroup> createState() => _FilterGroupState();
}

class _FilterGroupState extends State<_FilterGroup> {
  bool _isExpanded = true;
  final Set<String> _selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          ...widget.options.entries.map((entry) {
            bool isSelected = _selectedOptions.contains(entry.key);
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              value: isSelected,
              title: Text(entry.key),
              secondary: entry.value > 0 ? Text("(${entry.value})") : null,
              onChanged: (bool? newValue) {
                setState(() {
                  if (newValue == true) {
                    _selectedOptions.add(entry.key);
                  } else {
                    _selectedOptions.remove(entry.key);
                  }
                });
              },
              contentPadding: const EdgeInsets.all(0),
            );
          }),
        const Divider(),
      ],
    );
  }
}

class _PricingFilter extends StatefulWidget {
  const _PricingFilter();

  @override
  State<_PricingFilter> createState() => _PricingFilterState();
}

class _PricingFilterState extends State<_PricingFilter> {
  RangeValues _currentRangeValues = const RangeValues(200, 800);
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pricing",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Column(
            children: [
              RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 1000,
                divisions: 100,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${_currentRangeValues.start.round()}'),
                    Text('\$${_currentRangeValues.end.round()}'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        const Divider(),
      ],
    );
  }
}
