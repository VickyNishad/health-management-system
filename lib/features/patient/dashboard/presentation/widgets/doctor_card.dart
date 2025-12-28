import 'package:flutter/material.dart';

import '../../../../../core/components/prifile_image.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String experience;
  final String address;
  final String fee;
  final String rating;
  final VoidCallback onBookNow;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.experience,
    required this.address,
    required this.fee,
    required this.rating,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Doctor Image
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.asset(
          //     imagePath,
          //     width: 140,
          //     height: 140,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ProfileImage(imagePath: imagePath, isCircle: false, size: 150),

          const SizedBox(width: 20),

          // Text information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  experience,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),

                const SizedBox(height: 6),

                Text(
                  address,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text(
                      fee,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    Text(rating, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),

          // Book Button
          ElevatedButton(
            onPressed: onBookNow,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7B5BFF),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Book Now", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
