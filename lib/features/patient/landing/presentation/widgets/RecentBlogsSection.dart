import 'package:flutter/material.dart';

class RecentBlogsSection extends StatelessWidget {
  const RecentBlogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      color: Colors.white,
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
              "• Recent Blogs •",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Stay Updated With Our Latest Articles",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 50),

          // Blog Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: [
              _blogCard(
                "15",
                "May",
                "Treatments",
                "Understanding and Preventing Glaucoma: A Detailed Guide",
                "Glaucoma is a leading cause of blind worldwide, yet many....",
                "assets/images/doctor_img.png",
              ),
              _blogCard(
                "18",
                "May",
                "Neurology",
                "Understanding and Preventing Glaucoma: A Detailed Guide",
                "Discover the intersection of technology and neurology, transforming....",
                "assets/images/doctor_img.png",
              ),
              _blogCard(
                "21",
                "Apr",
                "Dental",
                "5 Essential Tips for Maintaining Optimal Oral Health",
                "Learn the top five daily practices to keep your teeth....",
                "assets/images/doctor_img.png",
              ),
              _blogCard(
                "22",
                "Jan",
                "Care & Treatment",
                "Beating Strong: The Digital Revol in Cardiac Care",
                "Discover how digital advancements are transforming cardiac care...",
                "assets/images/doctor_img.png",
              ),
            ],
          ),

          const SizedBox(height: 50),
          // View All Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0E1A3D),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View All Articles",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _blogCard(
    String day,
    String month,
    String tag,
    String title,
    String desc,
    String img,
  ) {
    return Row(
      children: [
        // Image with Date Overlay
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                img,
                width: 250,
                height: 180,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Column(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      month,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
