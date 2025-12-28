import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/HoverNavItem.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08), // soft shadow
            blurRadius: 12,
            offset: const Offset(0, 4), // shadow below navbar
          ),
        ],
      ),
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
          // Usage of the new HoverNavItem
          HoverNavItem(title: "Home", onTap: () {}),
          HoverNavItem(
            title: "Find Doctors",
            onTap: () {
              context.go('/search');
            },
          ),
          HoverNavItem(title: "Appointments", onTap: () {}),
          HoverNavItem(title: "Contact Us", onTap: () {}),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/patient/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Login / Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
