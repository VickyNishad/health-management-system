import 'package:flutter/material.dart';

class BookingProgressIndicator extends StatelessWidget {
  final int currentStep;

  const BookingProgressIndicator({super.key, required this.currentStep});

  final List<String> steps = const [
    "Specialty",
    "Appointment Type",
    "Date & Time",
    "Basic Information",
    "Payment",
    "Confirmation",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: steps.asMap().entries.map((entry) {
          int stepIndex = entry.key + 1;
          String stepName = entry.value;

          bool isCurrent = stepIndex == currentStep;
          bool isCompleted = stepIndex < currentStep;

          Color indicatorColor = isCompleted
              ? Colors.green
              : isCurrent
              ? Colors.blue
              : Colors.grey.shade400;

          return Column(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : Text(
                        '$stepIndex',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 4),
              Text(
                stepName,
                style: TextStyle(
                  color: isCurrent || isCompleted ? Colors.black : Colors.grey,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
