import 'package:flutter/material.dart';

class RecentInvoices extends StatelessWidget {
  const RecentInvoices({super.key});
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
                "Recent Invoices",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _invItem("Adrian", "#Apt0001", "\$450", "11 Nov 2024"),
          _invItem("Kelly", "#Apt0002", "\$500", "10 Nov 2024"),
          _invItem("Samuel", "#Apt0003", "\$320", "03 Nov 2024"),
        ],
      ),
    );
  }

  Widget _invItem(String name, String id, String price, String date) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 18,
        backgroundColor: Color(0xFFE3F2FD),
        child: Icon(Icons.person, size: 18),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(id, style: const TextStyle(fontSize: 11)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}
