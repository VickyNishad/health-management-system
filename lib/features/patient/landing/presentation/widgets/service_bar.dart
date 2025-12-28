import 'package:flutter/material.dart';

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
