import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart'
    show ProfileImage;

class UpcommingAppointments extends StatelessWidget {
  const UpcommingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upcoming Appointment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            // leading: CircleAvatar(
            //   backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
            // ),
            leading: ProfileImage(
              imagePath: "assets/images/doctor_img.png",
              isCircle: false,
              size: 40,
            ),
            title: Text(
              "Adrian Marshall",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "General visit • Today, 10:45 AM",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _btn("Chat Now", Colors.white.withOpacity(0.2), Colors.white),
              const SizedBox(width: 10),
              _btn("Start Appointment", Colors.white, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btn(String txt, Color bg, Color fg) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          txt,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
