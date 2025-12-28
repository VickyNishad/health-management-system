import 'dart:async';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF), // Light blue background
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const ServicesBar(),
            SpecialtiesSection(),
            FeaturedDoctorsSection(),
            ServiceTicker(),
            WhyBookSection(),
            DarkHeroAndProcessSection(),
            TestimonialsAndStatsSection(),
            FAQSection(),
            AppDownloadBanner(),
            RecentBlogsSection(),
            SupportBanner(),
            FinalFooter(),
          ],
        ),
      ),
    );
  }
}

// --- Navbar Widget ---
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          const Text(
            "MedicQue",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const Spacer(),
          _navItem("Home"),
          _navItem("Doctors"),
          _navItem("Patients"),
          _navItem("Pharmacy"),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: StadiumBorder(),
            ),
            child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0E1A3D),
              shape: StadiumBorder(),
            ),
            child: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}

// --- Hero Section ---
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
                        width: 90,
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
                        width: 70,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Date",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                ),
                const Icon(
                  Icons.person,
                  size: 300,
                  color: Colors.blue,
                ), // Replace with Image.network
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Bottom Services Bar ---
class ServicesBar extends StatelessWidget {
  const ServicesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 7, // How soft the shadow looks
              offset: Offset(0, 2), // Changes position (x, y)
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _serviceIcon(
              Icons.calendar_month,
              "Book Appointment",
              Colors.purple,
            ),
            _serviceIcon(Icons.people, "Talk to Doctors", Colors.blue),
            _serviceIcon(
              Icons.local_hospital,
              "Hospitals & Clinics",
              Colors.pink,
            ),
            _serviceIcon(Icons.medical_services, "Healthcare", Colors.orange),
            _serviceIcon(
              Icons.medical_services,
              "Medicine & Supplies",
              Colors.orange,
            ),
            _serviceIcon(Icons.medical_services, "Lab Testing", Colors.orange),
            _serviceIcon(Icons.medical_services, "Home Care", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _serviceIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// --- Specialties Section ---
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
                ),
                _doctorCard(
                  "Dr. Nicholas Tello",
                  "Pediatrician",
                  "4.8",
                  "Ogden, IA",
                  "\$400",
                  "assets/images/doctor_img.png",
                ),
                _doctorCard(
                  "Dr. Harold Bryant",
                  "Neurologist",
                  "4.9",
                  "Winona, MS",
                  "\$500",
                  "assets/images/doctor_img.png",
                ),
                _doctorCard(
                  "Dr. Sandra Jones",
                  "Cardiologist",
                  "4.7",
                  "Beckley, WV",
                  "\$550",
                  "assets/images/doctor_img.png",
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
                      onPressed: () {},
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

class ServiceTicker extends StatefulWidget {
  const ServiceTicker({super.key});

  @override
  State<ServiceTicker> createState() => _ServiceTickerState();
}

class _ServiceTickerState extends State<ServiceTicker> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the loop after the screen builds
    WidgetsBinding.instance.addPostFrameCallback((_) => _initTicker());
  }

  void _initTicker() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;

        // If maxScroll is 0, the list isn't long enough to scroll!
        if (maxScroll > 0) {
          if (currentScroll >= maxScroll) {
            _scrollController.jumpTo(0);
          } else {
            _scrollController.animateTo(
              currentScroll + 1,
              duration: const Duration(milliseconds: 30),
              curve: Curves.linear,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: const Color(0xFF00A3E1),
      child: ListView.builder(
        // Using .builder is better for infinite lists
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // This creates a never-ending list of items
          List<String> items = [
            "Hospitals & Clinics",
            "Health Care Services",
            "Talk to Doctors",
            "Home Care Services",
            "Lab Testing Services",
          ];
          return _tickerItem(items[index % items.length]);
        },
      ),
    );
  }

  Widget _tickerItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// class ServiceTicker extends StatefulWidget {
//   const ServiceTicker({super.key});

//   @override
//   State<ServiceTicker> createState() => _ServiceTickerState();
// }

// class _ServiceTickerState extends State<ServiceTicker> {
//   // 1. Create the controller
//   final ScrollController _scrollController = ScrollController();
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     // 2. Start scrolling only after the widget is built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startScrolling();
//     });
//   }

//   void _startScrolling() {
//     _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
//       if (_scrollController.hasClients) {
//         double maxScroll = _scrollController.position.maxScrollExtent;
//         double currentScroll = _scrollController.offset;

//         // 3. Reset to start if we hit the end for an infinite loop
//         if (currentScroll >= maxScroll) {
//           _scrollController.jumpTo(0);
//         } else {
//           _scrollController.animateTo(
//             currentScroll + 1, // Move 1 pixel every 50ms
//             duration: const Duration(milliseconds: 50),
//             curve: Curves.linear, // Linear makes it look smooth
//           );
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // 4. Always cancel timers to avoid memory leaks
//     _timer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       color: const Color(0xFF00A3E1),
//       child: ListView(
//         controller: _scrollController, // Link the controller here!
//         scrollDirection: Axis.horizontal,
//         physics:
//             const NeverScrollableScrollPhysics(), // Disables manual swiping
//         children: [
//           _tickerItem("Hospitals & Clinics"),
//           _tickerItem("Health Care Services"),
//           _tickerItem("Talk to Doctors"),
//           _tickerItem("Home Care Services"),
//           _tickerItem("Multi Speciality Treatments & Doctors"),
//           _tickerItem("Lab Testing Services"),
//           // Duplicate the first few items to make the loop look seamless
//           _tickerItem("Hospitals & Clinics"),
//           _tickerItem("Health Care Services"),
//         ],
//       ),
//     );
//   }

//   Widget _tickerItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Center(
//         child: Text(
//           text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ServiceTicker extends StatelessWidget {
//   const ServiceTicker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: double.infinity,
//       color: const Color(0xFF00A3E1), // Bright blue from image
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _tickerItem("Hospitals & Clinics"),
//           _tickerItem("Health Care Services"),
//           _tickerItem("Talk to Doctors"),
//           _tickerItem("Home Care Services"),
//           _tickerItem("Multi Speciality Treatments & Doctors"),
//           _tickerItem("Lab Testing Services"),
//         ],
//       ),
//     );
//   }

//   Widget _tickerItem(String text) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Container(width: 30, height: 1, color: Colors.white.withOpacity(0.5)),
//       ],
//     );
//   }
// }

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

class DarkHeroAndProcessSection extends StatelessWidget {
  const DarkHeroAndProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    // A dark background container for the entire section
    return Container(
      color: const Color(0xFF0E1A3D), // Deep Navy Blue background
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      child: Column(
        children: [
          // 1. Image/Text Row (Dark Hero)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Image Column
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    // Top Image
                    _darkImageContainer("assets/images/doctor_img.png", 300),
                    const SizedBox(height: 20),
                    // Bottom Split Images (Doctor and Vials)
                    Row(
                      children: [
                        Expanded(
                          child: _darkImageContainer(
                            "assets/images/doctor_img.png",
                            250,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _darkImageContainer(
                            "assets/images/doctor_img.png",
                            250,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),

              // Right: Text and Accordion Column
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
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
                      "We are committed to understanding your unique needs and delivering care.",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "As a trusted healthcare provider in our community, we are passionate about promoting health and wellness beyond the clinic. We actively engage in community outreach programs, health fairs, and educational workshop.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Accordion Panel (Our Vision / Our Mission)
                    _accordionPanel(
                      title: "01. Our Vision",
                      content:
                          "We envision a community where everyone has access to high-quality healthcare and the resources they need to lead healthy, fulfilling lives.",
                      isExpanded: true,
                    ),
                    const SizedBox(height: 15),
                    _accordionPanel(
                      title: "02. Our Mission",
                      content:
                          "To provide compassionate, comprehensive, and continuous health care services to individuals and families, promoting wellness and preventing disease.",
                      isExpanded: false,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 100),

          // 2. Four-Step Process Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _processStep(
                icon: Icons.search,
                iconColor: Colors.blue,
                title: "Search For Doctors",
                description:
                    "Search for a doctor based on specialization, location, or availability for your Treatments",
              ),
              _processArrow(),
              _processStep(
                icon: Icons.assignment_ind,
                iconColor: Colors.deepOrange,
                title: "Check Doctor Profile",
                description:
                    "Explore detailed doctor profiles on our platform to make informed healthcare decisions.",
              ),
              _processArrow(),
              _processStep(
                icon: Icons.schedule,
                iconColor: Colors.teal,
                title: "Schedule Appointment",
                description:
                    "After choose your prefered doctor, select a convenient time slot, & confirm your appointment.",
              ),
              _processArrow(),
              _processStep(
                icon: Icons.check_circle,
                iconColor: Colors.purple,
                title: "Get Your Solution",
                description:
                    "Discuss your health concerns with the doctor and receive the personalized advice & with solution.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _darkImageContainer(String imageUrl, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _accordionPanel({
    required String title,
    required String content,
    required bool isExpanded,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(
          0xFF091429,
        ), // Slightly darker background for the panel
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(isExpanded ? Icons.remove : Icons.add, color: Colors.white),
            ],
          ),
          if (isExpanded) ...[
            const SizedBox(height: 15),
            Text(
              content,
              style: const TextStyle(color: Colors.white70, height: 1.5),
            ),
          ],
        ],
      ),
    );
  }

  Widget _processStep({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return SizedBox(
      width: 200, // Fixed width for process steps
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: iconColor,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _processArrow() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Icon(Icons.arrow_right_alt, color: Colors.white54, size: 50),
    );
  }
}

//

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

//

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

class AppDownloadBanner extends StatelessWidget {
  const AppDownloadBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF007BFF), Color(0xFF00D4FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            // Background abstract shapes (optional)
            Positioned(
              left: -50,
              top: -50,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                children: [
                  // Left Side: Text and Buttons
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Download the Doccure\nApp today!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "To download an app related to a doctor or medical services, you can typically visit the app store on your device.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            _storeButton("Google Play", "GET IT ON"),
                            const SizedBox(width: 20),
                            _storeButton("App Store", "Download on the"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Right Side: Phone Mockups
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.network(
                        "assets/images/doctor_img.png", // Replace with your phone mockup asset
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storeButton(String storeName, String subText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            storeName == "App Store" ? Icons.apple : Icons.play_arrow,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subText,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              Text(
                storeName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//

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

//

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

class FinalFooter extends StatelessWidget {
  const FinalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F7FF), // Light blue background
      padding: const EdgeInsets.only(top: 80, left: 80, right: 80, bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navigation Columns
              _footerColumn("Company", [
                "About",
                "Features",
                "Works",
                "Careers",
                "Locations",
              ]),
              _footerColumn("Treatments", [
                "Dental",
                "Cardiac",
                "Spinal Cord",
                "Hair Growth",
                "Anemia & Disorder",
              ]),
              _footerColumn("Specialities", [
                "Transplant",
                "Cardiologist",
                "Oncology",
                "Pediatrics",
                "Gynacology",
              ]),
              _footerColumn("Utilites", [
                "Pricing",
                "Contact",
                "Request A Quote",
                "Premium Membership",
                "Integrations",
              ]),

              // Newsletter Column
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Newsletter",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E1A3D),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Subscribe & Stay Updated from the Doccure",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    // Email Input Field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Email Address",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.send,
                              size: 16,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00A3E1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Connect With Us",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E1A3D),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Social Icons Row
                    Row(
                      children: [
                        _socialIcon(Icons.facebook),
                        _socialIcon(Icons.close), // For X/Twitter
                        _socialIcon(Icons.camera_alt),
                        _socialIcon(Icons.business),
                        _socialIcon(Icons.push_pin),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.black12),
          const SizedBox(height: 20),

          // Bottom Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Copyright © 2025 Doccure. All Rights Reserved",
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  _bottomLink("Legal Notice"),
                  const Text(" • ", style: TextStyle(color: Colors.blue)),
                  _bottomLink("Privacy Policy"),
                  const Text(" • ", style: TextStyle(color: Colors.blue)),
                  _bottomLink("Refund Policy"),
                ],
              ),
              // Payment Logos Placeholder
              Row(
                children: [
                  _paymentIcon("VISA"),
                  _paymentIcon("AMEX"),
                  _paymentIcon("DISCOVER"),
                  _paymentIcon("STRIPE"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerColumn(String title, List<String> links) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E1A3D),
            ),
          ),
          const SizedBox(height: 20),
          ...links.map(
            (link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(link, style: const TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: const Color(0xFF0E1A3D)),
    );
  }

  Widget _bottomLink(String text) {
    return Text(text, style: const TextStyle(color: Colors.grey));
  }

  Widget _paymentIcon(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
