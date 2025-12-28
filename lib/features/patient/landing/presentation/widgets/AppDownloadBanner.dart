import 'package:flutter/material.dart';

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
