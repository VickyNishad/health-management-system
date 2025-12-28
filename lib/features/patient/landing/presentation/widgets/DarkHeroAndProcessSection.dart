import 'package:flutter/material.dart';

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
