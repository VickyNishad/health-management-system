import 'package:flutter/material.dart';
import 'package:medicque_app/search/bokking/booking_data.dart';

class Step2AppointmentType extends StatefulWidget {
  final BookingData data;
  final VoidCallback onNext;

  const Step2AppointmentType({
    super.key,
    required this.data,
    required this.onNext,
  });

  @override
  State<Step2AppointmentType> createState() => _Step2AppointmentTypeState();
}

class _Step2AppointmentTypeState extends State<Step2AppointmentType> {
  final List<Map<String, dynamic>> _clinics = const [
    {
      "name": "AllCare Family Medicine",
      "address": "3343 Private Lane, Valdosta",
      "distance": "500 Meters",
    },
    {
      "name": "Vitalplus Clinic",
      "address": "4223 Pleasant Hill Road, Miami, FL 33169",
      "distance": "12 KM",
    },
    {
      "name": "Wellness Path Chiropractic",
      "address": "418 Patton Lane, Garner, NC 27529",
      "distance": "16 KM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Select Appointment Type",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 15),

        // Appointment Type Buttons (Clinic, Video Call, etc.)
        SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTypeButton("Clinic", Icons.business, "Clinic"),
              _buildTypeButton("Video Call", Icons.videocam, "Video Call"),
              _buildTypeButton("Audio Call", Icons.call, "Audio Call"),
              _buildTypeButton("Chat", Icons.chat, "Chat"),
              _buildTypeButton("Home Visit", Icons.home, "Home Visit"),
            ],
          ),
        ),
        const SizedBox(height: 30),

        if (widget.data.appointmentType == 'Clinic')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Clinics",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              // Clinic List
              ..._clinics.map((clinic) => _buildClinicCard(clinic)),
            ],
          ),

        const SizedBox(height: 30),
        // Navigation Button
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     ElevatedButton.icon(
        //       onPressed:
        //           widget.data.appointmentType == 'Clinic' &&
        //               widget.data.clinicName.isEmpty
        //           ? null // Disable if Clinic is chosen but no clinic is selected
        //           : widget.onNext,
        //       icon: const Text("Select Date & Time"),
        //       label: const Icon(Icons.arrow_forward),
        //       style: ElevatedButton.styleFrom(
        //         foregroundColor: Colors.white,
        //         backgroundColor: Colors.blue,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 20,
        //           vertical: 15,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildTypeButton(String title, IconData icon, String type) {
    bool isSelected = widget.data.appointmentType == type;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.data.appointmentType = type;
            if (type != 'Clinic') {
              widget.data.clinicName =
                  ''; // Clear clinic selection if non-clinic type is chosen
            } else {
              // Auto-select the first clinic if returning to Clinic type
              widget.data.clinicName = _clinics.first['name'];
            }
          });
        },
        child: Container(
          width: 150,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.blue : Colors.black87,
                size: 25,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClinicCard(Map<String, dynamic> clinic) {
    bool isSelected = widget.data.clinicName == clinic['name'];
    return InkWell(
      onTap: () {
        setState(() {
          widget.data.clinicName = clinic['name'];
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Placeholder for Clinic Logo
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.local_hospital, color: Colors.grey),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinic['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        clinic['address'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Text(" • ", style: TextStyle(color: Colors.grey)),
                      Text(
                        clinic['distance'],
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
