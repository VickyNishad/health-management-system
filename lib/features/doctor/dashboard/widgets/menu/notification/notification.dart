import 'package:flutter/material.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});
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
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _notif(Icons.check_circle, "Booking Confirmed", "10:30 AM"),
          _notif(Icons.star, "New Review Received", "5 Days ago"),
        ],
      ),
    );
  }

  Widget _notif(IconData icon, String txt, String time) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.blue, size: 20),
      title: Text(txt, style: const TextStyle(fontSize: 12)),
      subtitle: Text(time, style: const TextStyle(fontSize: 10)),
    );
  }
}
