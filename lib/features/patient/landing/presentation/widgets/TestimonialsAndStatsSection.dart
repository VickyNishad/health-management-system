import 'package:flutter/material.dart';

class TestimonialsAndStatsSection extends StatelessWidget {
  const TestimonialsAndStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      color: const Color(0xFFF1F7FF), // Subtle blue background
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
              "• Testimonials •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "15k Users Trust Doccure Worldwide",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 50),

          // Testimonial Cards Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ReviewCard(
                title: "Nice Treatment",
                review:
                    "I had a wonderful experience the staff was friendly and attentive, and Dr. Smith took the time to explain everything clearly.",
                author: "Deny Hendrawan",
                location: "United States",
                imageUrl: "assets/images/doctor_img.png",
              ),
              _ReviewCard(
                title: "Good Hospitality",
                review:
                    "Genuinely cares about his patients. He helped me understand my condition and worked with me to create a plan.",
                author: "Johnson Dwayne",
                location: "United States",
                imageUrl: "assets/images/doctor_img.png",
              ),
              _ReviewCard(
                title: "Nice Treatment",
                review:
                    "I had a great experience with Dr. Chen. She was not only professional but also made me feel comfortable discussing.",
                author: "Rayan Smith",
                location: "United States",
                imageUrl: "assets/images/doctor_img.png",
              ),
            ],
          ),
          const SizedBox(height: 80),

          // High-Impact Statistics Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatItem(
                value: "500+",
                label: "Doctors Available",
                color: Colors.green,
              ),
              _StatItem(
                value: "18+",
                label: "Specialities",
                color: Colors.purple,
              ),
              _StatItem(
                value: "30K",
                label: "Bookings Done",
                color: Colors.blue,
              ),
              _StatItem(
                value: "97+",
                label: "Hospitals & Clinic",
                color: Colors.red,
              ),
              _StatItem(
                value: "317+",
                label: "Lab Tests Available",
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String title, review, author, location, imageUrl;
  const _ReviewCard({
    required this.title,
    required this.review,
    required this.author,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                ],
              ),
              const Icon(Icons.format_quote, color: Colors.orange, size: 30),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            review,
            style: TextStyle(color: Colors.grey.shade600, height: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  final Color color;
  const _StatItem({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Container(width: 40, height: 3, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
