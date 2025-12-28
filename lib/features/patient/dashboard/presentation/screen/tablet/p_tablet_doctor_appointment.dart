import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/prifile_image.dart';
import '../../../../../../core/config/menu_config_response.dart';
import '../../../../../../core/services/assets_json_loader.dart'
    show AssetJsonLoader;
import '../../../../../../core/services/menu_service.dart';
import '../../../../../../core/utils/app_roles.dart';
import '../../../../../../layouts/app_portal_layout.dart';
import '../../../../slot_managment/presentaion/widgets/slot_date_selector.dart';
import '../../../data/models/doctor_slot.dart';

class PTabletDoctorAppointment extends StatefulWidget {
  const PTabletDoctorAppointment({super.key});

  @override
  State<PTabletDoctorAppointment> createState() =>
      _PTabletDoctorAppointmentState();
}

class _PTabletDoctorAppointmentState extends State<PTabletDoctorAppointment> {
  DoctorSlotModel? doctor;
  int selectedDateIndex = 0;
  int? selectedSlotId; // Track selected slot ID

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Map<String, dynamic> json = await AssetJsonLoader.loadJsonAsset(
      'doctor_appointment.json',
    );
    doctor = DoctorSlotModel.fromJson(json);

    setState(() {});
  }

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
          showMenuInAppBar: false,
          child: _buidUI(context),
        );
      },
    );
  }

  Widget _buidUI(BuildContext context) {
    if (doctor == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final selectedDate = doctor!.dates[selectedDateIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildDoctorCard(),
          const SizedBox(height: 24),
          SlotDateSelector(
            doctorSlotModel: doctor,
            onDateSelected: (value) {
              setState(() {
                selectedDateIndex = value;
                selectedSlotId = null;
              });
            },
          ),
          // buildDateSelector(),
          const SizedBox(height: 24),
          buildTimeSections(selectedDate),
        ],
      ),
    );
  }

  // Doctor Card
  Widget buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12),
          //   child: Image.asset(
          //     "assets/images/doctor.png",
          //     height: 100,
          //     width: 100,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ProfileImage(
            imagePath: 'assets/images/doctor_img.png',
            isCircle: false,
            size: 150,
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor!.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(doctor!.experience),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(doctor!.location)),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Clinic: ${doctor!.clinic}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateSelector() {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          // Left calendar icon (fixed)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF7367F0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today_outlined,
              color: Color(0xFF7367F0),
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          // Scrollable date list
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(doctor!.dates.length, (index) {
                  final d = doctor!.dates[index];
                  final isSelected = index == selectedDateIndex;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                          selectedSlotId = null;
                        });
                      },
                      child: Container(
                        width: 185,
                        height: 52,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF7367F0)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF7367F0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              d.day,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF7367F0),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              d.slots,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF7367F0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Right arrow icon (fixed)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF7367F0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF7367F0),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Time Sections with colored slot buttons, booked disabled, selected purple filled
  Widget buildTimeSections(DateModel date) {
    IconData getIconForSection(String section) {
      switch (section) {
        case 'Morning':
          return Icons.wb_sunny;
        case 'Afternoon':
          return Icons.cloud;
        case 'Evening':
          return Icons.nightlight_round;
        case 'Night':
          return Icons.dark_mode;
        default:
          return Icons.access_time;
      }
    }

    return Column(
      children: date.timeSections.entries.map((entry) {
        final sectionName = entry.key;
        final slots = entry.value;

        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF7367F0), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    getIconForSection(sectionName),
                    color: const Color(0xFF7367F0),
                  ),
                  const SizedBox(width: 6),

                  Text(
                    sectionName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7367F0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: slots.map((slot) {
                  final bool isBooked = slot.status == "Booked";
                  final bool isSelected = selectedSlotId == slot.id;

                  Color bgColor;
                  Color borderColor;
                  Color textColor;

                  if (isBooked) {
                    bgColor = Colors.grey.shade300;
                    borderColor = Colors.grey.shade300;
                    textColor = Colors.grey.shade600;
                  } else if (isSelected) {
                    bgColor = const Color(0xFF7367F0);
                    borderColor = const Color(0xFF7367F0);
                    textColor = Colors.white;
                  } else {
                    bgColor = Colors.white;
                    borderColor = const Color(0xFF7367F0);
                    textColor = const Color(0xFF7367F0);
                  }

                  return GestureDetector(
                    onTap: isBooked
                        ? null
                        : () {
                            setState(() {
                              selectedSlotId = slot.id;
                              print('called');
                              context.go(
                                '/patient/dashboard/doctor_slot/booking',
                              );
                            });
                          },
                    child: Container(
                      width: 106,
                      height: 38,
                      // padding: const EdgeInsets.symmetric(
                      //   horizontal: 14,
                      //   vertical: 10,
                      // ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor, width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          slot.time,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
