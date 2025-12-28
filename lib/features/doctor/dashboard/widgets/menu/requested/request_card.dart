import 'package:flutter/material.dart';
import 'package:medicque_app/core/components/prifile_image.dart';
import 'package:medicque_app/features/doctor/dashboard/data/models/request_model.dart';
import 'package:medicque_app/features/doctor/dashboard/widgets/menu/requested/request_action_buttons.dart';

class RequestCard extends StatelessWidget {
  final RequestModel request;

  const RequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Patient Avatar & Name
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Image.network(
          //     'https://i.pravatar.cc/150?u=${request.name}',
          //     width: 50,
          //     height: 50,
          //   ),
          // ),
          ProfileImage(
            imagePath: "assets/images/doctor_img.png",
            isCircle: true,
            size: 50,
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  request.id,
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      request.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (request.isNew) ...[
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          // Date & Purpose
          Expanded(
            flex: 3,
            child: Row(
              children: [
                const Icon(
                  Icons.access_time_filled,
                  size: 18,
                  color: Color(0xFF2D3E50),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.date,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      request.purpose,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Appointment Type
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Type of Appointment",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(request.typeIcon, size: 16, color: request.typeColor),
                    const SizedBox(width: 5),
                    Text(
                      request.type,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),

          RequestActionButtons(onAccept: () {}, onReject: () {}),
        ],
      ),
    );
  }
}
