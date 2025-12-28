import 'package:flutter/material.dart';
import '../../../../../../core/components/prifile_image.dart';
import '../../../data/models/appointment_booking.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  // You might want to pass an Appointment object here to display actual data
  // For now, using hardcoded data matching the image.
  final Appointment? appointment;

  const AppointmentDetailsScreen({super.key, this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context), // Reusing the custom app bar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back to Home
                TextButton.icon(
                  onPressed: () {
                    // Navigate back
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Back to Home',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),

                // Title
                const Text(
                  'Appointment Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Review your appointment details and download it.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Spacer to push content to center/bottom
          const Spacer(),

          // The central Ticket Card
          Center(
            child: TicketCard(
              appointment:
                  appointment ??
                  appointments[0], // Use passed appointment or first dummy one
            ),
          ),

          // Spacer to push content to center/bottom
          const Spacer(),

          // Close Button
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the screen
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: kPrimaryPurple,
                  side: const BorderSide(color: kPrimaryPurple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Reusing the Custom App Bar from MyAppointmentsScreen ---
// (You could abstract this into a common_widgets.dart if used in many places)
PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo (Placeholder for MedicQue)
            Row(
              children: [
                // Assuming you have 'assets/logo.png'
                // Image.asset('assets/logo.png', height: 30),
                const Text(
                  'MedicQue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryPurple,
                  ),
                ),
              ],
            ),

            // Navigation Links
            const Row(
              children: [
                _NavLink(title: 'Home', isSelected: false),
                SizedBox(width: 20),
                _NavLink(title: 'Book Appointment', isSelected: false),
                SizedBox(width: 20),
                _NavLink(
                  title: 'My Appointments',
                  isSelected: true,
                ), // Still highlighted
                SizedBox(width: 20),
                _NavLink(title: 'Help & Support', isSelected: false),
              ],
            ),

            // Profile and Login/Sign Up
            Row(
              children: [
                const Icon(Icons.person_outline, color: Colors.grey),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Login/Sign Up',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _NavLink extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _NavLink({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isSelected ? kPrimaryPurple : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          Container(
            height: 2,
            width: title.length * 8.0,
            color: kPrimaryPurple,
          ),
      ],
    );
  }
}

// --- The central Ticket Card widget ---
class TicketCard extends StatelessWidget {
  final Appointment appointment;

  const TicketCard({super.key, required this.appointment});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Cancelled':
        return kRedCancelled;
      case 'Completed':
        return kGreenCompleted;
      case 'Pending':
        return const Color(0xFFFFF9E5);
      case 'Rescheduled':
        return kLightPurple;
      default:
        return Colors.grey.shade200;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'Cancelled':
        return Colors.red.shade700;
      case 'Completed':
        return kPrimaryGreen;
      case 'Pending':
        return Colors.orange.shade700;
      case 'Rescheduled':
        return kPrimaryPurple;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(appointment.status);
    final statusTextColor = _getStatusTextColor(appointment.status);

    return Container(
      width: 400, // Fixed width for the card as per design
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To wrap content tightly
        children: [
          // Top Bar: Ticket # and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket #${appointment.tokenNo}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the card/dialog
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          ProfileImage(
            imagePath: 'assets/images/doctor_img.png',
            isCircle: false,
            size: 150,
          ),
          const SizedBox(height: 20),

          // Doctor Details
          Text(
            'Doctor : ${appointment.doctorName}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            '(${appointment.specialization})',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Clinic: ${appointment.clinicName}',
            style: const TextStyle(fontSize: 15, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text(
                'Date & Time : ${appointment.date} at ${appointment.timeRange}',
                style: const TextStyle(fontSize: 15, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Status Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {}, // Status is usually not clickable
              style: ElevatedButton.styleFrom(
                backgroundColor: statusColor,
                foregroundColor: statusTextColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0, // No shadow for status button
              ),
              child: Text(
                appointment.status,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Download Details Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle download logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Download Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
