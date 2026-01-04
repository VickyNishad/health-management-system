import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedDoctorsSection extends StatelessWidget {
  const FeaturedDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
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
              "• Featured Doctors •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Our Highlighted Doctors",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 40),

          // Horizontal List of Doctor Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _doctorCard(
                  "Dr. Michael Brown",
                  "Psychologist",
                  "4.5",
                  "Minneapolis, MN",
                  "\$650",
                  "assets/images/doctor_img.png",
                  () {
                    context.go('/book');
                  },
                ),
                _doctorCard(
                  "Dr. Nicholas Tello",
                  "Pediatrician",
                  "4.8",
                  "Ogden, IA",
                  "\$400",
                  "assets/images/doctor_img.png",
                  () {
                    context.go('/book');
                  },
                ),
                _doctorCard(
                  "Dr. Harold Bryant",
                  "Neurologist",
                  "4.9",
                  "Winona, MS",
                  "\$500",
                  "assets/images/doctor_img.png",
                  () {
                    context.go('/book');
                  },
                ),
                _doctorCard(
                  "Dr. Sandra Jones",
                  "Cardiologist",
                  "4.7",
                  "Beckley, WV",
                  "\$550",
                  "assets/images/doctor_img.png",
                  () {
                    context.go('/book');
                  },
                ),
              ],
            ),
          ),

          // Navigation arrows
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navArrow(Icons.arrow_back),
              const SizedBox(width: 15),
              _navArrow(Icons.arrow_forward),
            ],
          ),
        ],
      ),
    );
  }

  Widget _doctorCard(
    String name,
    String specialty,
    String rating,
    String location,
    String fee,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Badge Header
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 14),
                      Text(
                        " $rating",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          // Card Body
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      specialty,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "● Available",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    Text(
                      " $location • 30 Min",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Consultation Fees",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          fee,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E1A3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navArrow(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.blue, size: 20),
    );
  }
}
