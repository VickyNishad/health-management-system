import 'package:flutter/material.dart';

import '../../../../../../core/components/prifile_image.dart';
import '../../../../../../core/config/menu_config_response.dart';
import '../../../../../../core/services/assets_json_loader.dart';
import '../../../../../../core/services/menu_service.dart';
import '../../../../../../core/utils/app_roles.dart';
import '../../../../../../layouts/app_portal_layout.dart';
import '../../../data/models/appointment_booking.dart';
import 'appointment_details_screen.dart';

class PWebMyAppointments extends StatelessWidget {
  const PWebMyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: AssetJsonLoader.loadJsonAsset('menu_config.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Failed to load menu config'));
        }

        // ✅ JSON is ready
        final config = MenuConfigResponse.fromJson(snapshot.data!);

        final menu = MenuService.getMenuForUser(
          role: AppRole.patient,
          apiPermissions: [], // pass API permissions
          config: config,
        );

        return AppPortalLayout(
          role: AppRole.patient,
          menuItems: menu,
          showMenuInAppBar: true,
          child: _buildUI(context),
        );
      },
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [
        // Filter, Search, and Sort Bar
        _buildControlBar(context),

        // Appointment List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return AppointmentCard(appointment: appointments[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildControlBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back to Home
          TextButton.icon(
            onPressed: () {},
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

          // Filters, Search, and Sort
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Filter Buttons (All / Today)
              Row(
                children: [
                  _FilterButton(label: 'All', isSelected: true),
                  const SizedBox(width: 8),
                  _FilterButton(label: 'Today', isSelected: false),
                ],
              ),
              const SizedBox(width: 20),

              // Search Bar
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by Doctors, Clinic, PinCode etc.',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),

              // Sort By
              Row(
                children: [
                  const Text(
                    'Sort by',
                    style: TextStyle(color: kPrimaryPurple),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: kPrimaryPurple,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterButton({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// --- Appointment Card Widget ---

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Cancelled':
        return kRedCancelled;
      case 'Completed':
        return kGreenCompleted;
      case 'Pending':
        return const Color(0xFFFFF9E5); // Yellowish tone
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

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ProfileImage(
              imagePath: 'assets/images/doctor_img.png',
              isCircle: false,
              size: 120,
            ),
            const SizedBox(width: 15),

            // Center: Appointment Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Name and Specialization
                  Row(
                    children: [
                      Text(
                        appointment.doctorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${appointment.specialization})',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Token No and Clinic
                  Text(
                    'Token No. : ${appointment.tokenNo}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    appointment.clinicName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),

                  // Date and Time
                  Text(
                    '${appointment.date} at ${appointment.timeRange}',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // Right: Status and Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    appointment.status,
                    style: TextStyle(
                      color: statusTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // View Details Button
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentDetailsScreen(
                          appointment:
                              appointment, // Pass the current appointment object
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kPrimaryPurple,
                    side: const BorderSide(color: kPrimaryPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
