import 'package:flutter/material.dart';

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
