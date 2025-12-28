import 'dart:async';

import 'package:flutter/material.dart';

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
