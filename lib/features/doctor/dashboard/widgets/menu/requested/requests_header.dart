import 'package:flutter/material.dart';

class RequestsHeader extends StatelessWidget {
  final String title;
  final String filterText;

  const RequestsHeader({
    super.key,
    required this.title,
    this.filterText = "Last 7 Days",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Requests",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D1B3E),
          ),
        ),
        // Filter Dropdown placeholder
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Row(
            children: [
              Text("Last 7 Days", style: TextStyle(fontSize: 14)),
              Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
