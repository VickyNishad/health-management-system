import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      padding: const EdgeInsets.only(left: 100),
      child: Row(
        children: [
          // Left Text Side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Discover Health: Find Your",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Trusted Doctors Today",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                // Search Bar Container
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      const Icon(Icons.search, color: Colors.grey),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search doctors...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40, // set as needed
                        child: const VerticalDivider(
                          color: Colors.grey,
                          width: 20,
                          thickness: 1,
                        ),
                      ),
                      // const VerticalDivider(),
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Location",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      // const VerticalDivider(color: Colors.black, width: 20),
                      SizedBox(
                        height: 40, // set as needed
                        child: const VerticalDivider(
                          color: Colors.grey,
                          width: 20,
                          thickness: 1,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.grey),
                      const SizedBox(
                        width: 90,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Date",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.go('/search');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                        ),
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right Image Side
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Placeholder for the Doctor Image
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    // color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: ProfileImage(
                    imagePath: 'assets/images/doctor_img.png',
                    isCircle: true,
                    size: 400,
                  ),
                ),
                // const Icon(
                //   Icons.person,
                //   size: 300,
                //   color: Colors.blue,
                // ), // Replace with Image.network
              ],
            ),
          ),
        ],
      ),
    );
  }
}
