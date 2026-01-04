import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 150,
      ), // Wide horizontal padding for desktop
      color: Colors.white,
      child: Column(
        children: [
          // Section Label
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "• FAQ'S •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Your Questions are Answered",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 50),

          // FAQ List
          _buildFAQItem(
            "How do I book an appointment with a doctor?",
            "Yes, simply visit our website and log in or create an account. Search for a doctor based on specialization, location, or availability & confirm your booking.",
            initiallyExpanded: true,
          ),
          _buildFAQItem(
            "Can I request a specific doctor when booking my appointment?",
            "",
          ),
          _buildFAQItem(
            "What should I do if I need to cancel or reschedule my appointment?",
            "",
          ),
          _buildFAQItem("What if I'm running late for my appointment?", ""),
          _buildFAQItem(
            "Can I book appointments for family members or dependents?",
            "",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(
    String question,
    String answer, {
    bool initiallyExpanded = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        tilePadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0E1A3D),
          ),
        ),
        // Custom +/- Icons
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            initiallyExpanded ? Icons.remove : Icons.add,
            color: Colors.blue,
            size: 20,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              answer,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.6,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
