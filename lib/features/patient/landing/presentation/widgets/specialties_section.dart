import 'package:flutter/material.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
      child: Column(
        children: [
          // Section Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "• Top Specialties •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Highlighting the Care & Support",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 40),

          // Specialties Grid/List
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _specialtyCard(
                  "Cardiology",
                  "254 Doctors",
                  Icons.favorite_border,
                ),
                _specialtyCard(
                  "Orthopedics",
                  "151 Doctors",
                  Icons.accessibility_new,
                ),
                _specialtyCard("Neurology", "176 Doctors", Icons.psychology),
                _specialtyCard("Pediatrics", "124 Doctors", Icons.child_care),
                _specialtyCard("Psychiatry", "112 Doctors", Icons.face),
                _specialtyCard(
                  "Endocrinology",
                  "104 Doctors",
                  Icons.medication,
                ),
                _specialtyCard("Pulmonology", "41 Doctors", Icons.air),
                _specialtyCard("Urology", "39 Doctors", Icons.water_drop),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Navigation Arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navArrow(Icons.arrow_back_ios_new),
              const SizedBox(width: 10),
              _navArrow(Icons.arrow_forward_ios),
            ],
          ),
        ],
      ),
    );
  }

  Widget _specialtyCard(String title, String count, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 140,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                  image: DecorationImage(
                    image: const AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain, // better for logo watermark
                    alignment: Alignment.center,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.15), // watercolor feel
                      BlendMode.srcATop,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),

              // Foreground Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.blue, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(count, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  // Widget _specialtyCard(String title, String count, IconData icon) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: Column(
  //       children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             // Background Image Container
  //             Container(
  //               width: 140,
  //               height: 180,
  //               decoration: BoxDecoration(
  //                 color: Colors
  //                     .grey[100], // Optional: sets a base color under the image
  //                 borderRadius: BorderRadius.circular(20),
  //                 image: const DecorationImage(
  //                   image: AssetImage('assets/images/logo.png'),
  //                   fit: BoxFit.cover,
  //                   // Control transparency here (0.0 is invisible, 1.0 is solid)
  //                   opacity: 0.3,
  //                 ),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black.withOpacity(0.05),
  //                     blurRadius: 10,
  //                     offset: const Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             // Overlay Icon
  //             Container(
  //               padding: const EdgeInsets.all(12),
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Icon(icon, color: Colors.blue, size: 30),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 15),
  //         Text(
  //           title,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //         ),
  //         Text(count, style: const TextStyle(color: Colors.grey, fontSize: 13)),
  //       ],
  //     ),
  //   );
  // }

  // Widget _specialtyCard(String title, String count, IconData icon) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: Column(
  //       children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             // Background Image Container
  //             Container(
  //               width: 140,
  //               height: 180,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 image: const DecorationImage(
  //                   image: NetworkImage(
  //                     'assets/images/logo.png',
  //                   ), // Replace with your assets
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             // Overlay Icon
  //             Container(
  //               padding: const EdgeInsets.all(12),
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Icon(icon, color: Colors.blue, size: 30),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 15),
  //         Text(
  //           title,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  //         ),
  //         Text(count, style: const TextStyle(color: Colors.grey, fontSize: 13)),
  //       ],
  //     ),
  //   );
  // }

  Widget _navArrow(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: Colors.blue),
    );
  }
}
