import 'package:flutter/material.dart';
import 'package:medicque_app/features/doctor/dashboard/data/models/request_model.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/requested/request_card.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/requested/requests_header.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequestsHeader(title: 'Requests', filterText: 'Last 7 Days'),
        const SizedBox(height: 20),
        RequestCard(
          request: RequestModel(
            id: "#Apt0001",
            name: "Adrian",
            date: "11 Nov 2024 10:45 AM",
            purpose: "General Visit",
            type: "Video Call",
            typeIcon: Icons.videocam,
            typeColor: Colors.blue,
            isNew: true,
          ),
        ),
        RequestCard(
          request: RequestModel(
            id: "#Apt0002",
            name: "Adrian",
            date: "11 Nov 2024 10:45 AM",
            purpose: "General Visit",
            type: "Video Call",
            typeIcon: Icons.videocam,
            typeColor: Colors.blue,
            isNew: true,
          ),
        ),

        RequestCard(
          request: RequestModel(
            id: "#Apt0002",
            name: "Adrian",
            date: "11 Nov 2024 10:45 AM",
            purpose: "General Visit",
            type: "Video Call",
            typeIcon: Icons.videocam,
            typeColor: Colors.blue,
            isNew: true,
          ),
        ),

        RequestCard(
          request: RequestModel(
            id: "#Apt0002",
            name: "Adrian",
            date: "11 Nov 2024 10:45 AM",
            purpose: "General Visit",
            type: "Video Call",
            typeIcon: Icons.videocam,
            typeColor: Colors.blue,
            isNew: true,
          ),
        ),
      ],
    );
  }
}
