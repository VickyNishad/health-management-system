import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicque_app/features/patient/dashboard/data/models/doctor_booking.dart';

// class PDoctorAppointmentBookingWeb extends StatelessWidget {
//   const PDoctorAppointmentBookingWeb({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class PDoctorAppointmentBookingWeb extends StatefulWidget {
  const PDoctorAppointmentBookingWeb({super.key});
  @override
  State<PDoctorAppointmentBookingWeb> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<PDoctorAppointmentBookingWeb> {
  late DoctorBooking doctor;
  DateTime? selectedDate;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    // Use the sample JSON inline. Alternatively, load from assets or network.
    final jsonString = '''
    {
      "name": "Dr. Himesh Pathak",
      "experience": "29 years experience overall",
      "location": "Chembur, Mumbai, 400071",
      "clinic": "Smile Multi Speciality Clinic",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "imageUrl": "/mnt/data/783e7a16-7e85-419e-a954-6771d2dde467.png",
      "appointmentDate": "2025-09-05",
      "appointmentTime": "10:00 AM"
    }
    ''';
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    doctor = DoctorBooking.fromJson(map);

    // initialize selected date/time from JSON
    selectedDate = DateFormat('yyyy-MM-dd').parse(doctor.appointmentDate);
    selectedTime = doctor.appointmentTime;
  }

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        // Format or keep as you want
      });
    }
  }

  void _pickTime() async {
    // show 12-hour time picker
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: _stringToTimeOfDay(selectedTime ?? '10:00 AM'),
    );

    if (timeOfDay != null) {
      final formatted = DateFormat.jm().format(
        DateTime(0, 1, 1, timeOfDay.hour, timeOfDay.minute),
      );
      setState(() {
        selectedTime = formatted;
      });
    }
  }

  TimeOfDay _stringToTimeOfDay(String t) {
    try {
      final dt = DateFormat.jm().parse(t);
      return TimeOfDay(hour: dt.hour, minute: dt.minute);
    } catch (_) {
      return const TimeOfDay(hour: 10, minute: 0);
    }
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('/') || imageUrl.startsWith('file://')) {
      // local file path
      try {
        final file = File(imageUrl);
        if (file.existsSync()) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(file, width: 140, height: 140, fit: BoxFit.cover),
          );
        }
      } catch (_) {}
      // fallback placeholder
      return Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.person, size: 72, color: Colors.grey),
      );
    } else {
      // treat as network url
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 140,
          height: 140,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel = selectedDate != null
        ? DateFormat('dd MMMM yyyy').format(selectedDate!)
        : 'Select Date';
    final timeLabel = selectedTime ?? 'Select Time';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'In-clinic Appointment',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(doctor.imageUrl),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.medical_services_outlined, size: 16),
                          const SizedBox(width: 8),
                          Flexible(child: Text(doctor.experience)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16),
                          const SizedBox(width: 8),
                          Flexible(child: Text(doctor.location)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.apartment_outlined, size: 16),
                          const SizedBox(width: 8),
                          Flexible(child: Text(doctor.clinic)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
            Text(
              doctor.description,
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.calendar_today_outlined),
                    label: Text(dateLabel),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF7B61FF)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickTime,
                    icon: const Icon(Icons.schedule),
                    label: Text('AT $timeLabel'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF7B61FF)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // change date/time: open both pickers to re-choose
                _pickDate();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.sync, size: 16, color: Color(0xFF7B61FF)),
                  SizedBox(width: 6),
                  Text(
                    'Change Date & Time',
                    style: TextStyle(color: Color(0xFF7B61FF)),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Confirm action: show a dialog with summary
                  final dateText = selectedDate != null
                      ? DateFormat('dd MMMM yyyy').format(selectedDate!)
                      : 'Not selected';
                  final timeText = selectedTime ?? 'Not selected';
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Confirm Booking'),
                      content: Text(
                        '${doctor.name}\n$dateText at $timeText\n${doctor.clinic}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Booking confirmed!'),
                              ),
                            );
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF7B61FF)),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(color: Color(0xFF7B61FF), fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
