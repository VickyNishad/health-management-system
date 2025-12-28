import 'package:flutter/material.dart';

class WhyBookSection extends StatelessWidget {
  const WhyBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      child: Column(
        children: [
          // Section Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "• Why Book With Us •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Compelling Reasons to Choose",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 60),

          // Features Row
          IntrinsicHeight(
            child: Row(
              children: [
                _featureItem(
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.deepOrange,
                  title: "Follow-Up Care",
                  description:
                      "We ensure continuity of care through regular follow-ups and communication, helping you stay on track with health goals.",
                ),
                _verticalDivider(),
                _featureItem(
                  icon: Icons.waves,
                  iconColor: Colors.purple,
                  title: "Patient-Centered Approach",
                  description:
                      "We prioritize your comfort and preferences, tailoring our services to meet your individual needs and Care from Our Experts",
                ),
                _verticalDivider(),
                _featureItem(
                  icon: Icons.add_task,
                  iconColor: Colors.teal,
                  title: "Convenient Access",
                  description:
                      "Easily book appointments online or through our dedicated customer service team, with flexible hours to fit your schedule.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return VerticalDivider(
      color: Colors.grey.shade300,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
