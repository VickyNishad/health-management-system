import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

class RecentPatients extends StatelessWidget {
  const RecentPatients({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Patients",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _pBox("Adrian Marshall", "P0001"),
              const SizedBox(width: 15),
              _pBox("Kelly Stevens", "P0002"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pBox(String name, String id) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // const CircleAvatar(
            //   radius: 20,
            //   backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a'),
            // ),
            ProfileImage(
              imagePath: "assets/images/doctor_img.png",
              isCircle: true,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "ID: $id",
              style: const TextStyle(fontSize: 10, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
