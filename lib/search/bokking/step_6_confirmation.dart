import 'package:flutter/material.dart';
import 'package:medicque_app/search/bokking/booking_data.dart';

// Note: You would need a package like 'qr_flutter' for a real QR code
// import 'package:qr_flutter/qr_flutter.dart';

class Step6Confirmation extends StatelessWidget {
  final BookingData data;
  final VoidCallback onNext;

  const Step6Confirmation({
    super.key,
    required this.data,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side: Booking Details and Help
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 8),
                  const Text(
                    "Booking Confirmed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Your booking has been Confirmed with Dr. Michael Brown be on time before 15 Mins From the appointment Time",
              ),
              const SizedBox(height: 20),

              // Booking Info Card
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Booking Info",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.edit, size: 16),
                          label: const Text("Reschedule"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildDetailItem("Service", "Cardiology (30 Mins)"),
                        const SizedBox(width: 30),
                        _buildDetailItem(
                          "Additional Service",
                          "Echocardiograms",
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        _buildDetailItem(
                          "Date & Time",
                          "10:00 - 11:00 AM, 15, Oct 2025",
                        ),
                        const SizedBox(width: 30),
                        _buildDetailItem("Appointment type", "Clinic"),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        _buildDetailItem(
                          "Clinic Name & Location",
                          "${data.clinicName} ",
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("View Location"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Need Assistance Section
              const Text(
                "Need Our Assistance",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Call us in case you face any issue on Booking / Cancellation",
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call, size: 16),
                    label: const Text("Call Us"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),

        // Right Side: QR Code and Actions
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "DCRA12565",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 15),
              // Placeholder for QR Code
              Container(
                width: 150,
                height: 150,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    "QR CODE\n(Package required)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Scan this QR Code to Download the details of Appointment",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today, size: 16),
                label: const Text("Add To Calendar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: onNext,
                icon: const Icon(Icons.add, size: 16),
                label: const Text("Start New Booking"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
