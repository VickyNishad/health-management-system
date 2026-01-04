import 'package:flutter/material.dart';

class SupportBanner extends StatelessWidget {
  const SupportBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFF00A3E1), // Bright blue from image
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Left: Headline
          const Expanded(
            flex: 2,
            child: Text(
              "Working for Your Better Health.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Right: Contact Info Items
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _contactInfo(
                  icon: Icons.headset_mic_outlined,
                  label: "Customer Support",
                  value: "+1 56589 54598",
                ),
                const SizedBox(width: 40),
                _contactInfo(
                  icon: Icons.chat_bubble_outline,
                  label: "Drop Us an Email",
                  value: "info1256@example.com",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactInfo({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        // Circular Icon
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF00A3E1), size: 28),
        ),
        const SizedBox(width: 15),
        // Text Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
