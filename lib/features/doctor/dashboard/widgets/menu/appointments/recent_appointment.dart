import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class RecentAppointment extends StatelessWidget {
  const RecentAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Appointment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Last 7 Days", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Divider(height: 30),
            _appointmentItem(
              "Adrian Marshall",
              "11 Nov 2024",
              "10:45 AM",
              "General",
            ),
            _appointmentItem(
              "Kelly Stevens",
              "10 Nov 2024",
              "10:00 AM",
              "General",
            ),
            _appointmentItem(
              "Samuel Anderson",
              "03 Nov 2024",
              "02:00 PM",
              "Clinic Consulting",
            ),

            _appointmentItem(
              "Adrian Marshall",
              "11 Nov 2024",
              "10:45 AM",
              "General",
            ),
          ],
        ),
      ),
    );
  }

  Widget _appointmentItem(String name, String date, String time, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // const CircleAvatar(
          //   radius: 20,
          //   backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=13'),
          // ),
          ProfileImage(
            imagePath: "assets/images/doctor_img.png",
            isCircle: false,
            size: 40,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  type,
                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ],
            ),
          ),
          Text(
            "$date\n$time",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.right,
          ),
          const SizedBox(width: 20),
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          const Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
        ],
      ),
    );
  }
}
