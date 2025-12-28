import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:medicque_app/features/patient/dashboard/data/models/patient_info.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/add_patient_form.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/date_time_card.dart';

import '../../../../../../core/components/prifile_image.dart';
import '../../../../dashboard/data/models/doctor_booking.dart';
import '../../widgets/clinic_dropdown.dart';
import '../../widgets/doctor_info_row.dart';
import '../../widgets/doctor_name.dart';

class WebSlotConfirmation extends StatefulWidget {
  const WebSlotConfirmation({super.key});

  @override
  State<WebSlotConfirmation> createState() => _WebSlotConfirmationState();
}

class _WebSlotConfirmationState extends State<WebSlotConfirmation> {
  final List<PatientInfo> _patients = [];

  DoctorBooking? doctor;

  // initial appointment values (from json)
  DateTime? selectedDate;
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    // print(selectedDate.day);
    return _buildUI(context);
  }

  void _openAddPatientSheet({PatientInfo? edit, int? editIndex}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AddPatientForm(
          initialName: edit?.name,
          initialAge: edit?.age,
          initialMobile: edit?.mobile,
          onSubmit: (name, age, mobile) {
            final patient = PatientInfo(name: name, age: age, mobile: mobile);

            if (editIndex != null) {
              _patients[editIndex] = patient;
            } else {
              _patients.add(patient);
            }
            setState(() {});
          },
        );
      },
    );
  }

  Widget _buildUI(BuildContext ctx) {
    return Column(
      children: [
        docorProfileCard(ctx),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Patients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _openAddPatientSheet(),
              icon: const Icon(Icons.person_add),
              label: const Text('Add Patient'),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Patient list (keeps state across rebuilds)
        Expanded(
          child: _patients.isEmpty
              ? const Center(child: Text('No patients added yet.'))
              : ListView.separated(
                  itemCount: _patients.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    final p = _patients[index];
                    return Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        title: Text(p.name),
                        subtitle: Text('Age: ${p.age} • ${p.mobile}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _openAddPatientSheet(
                                edit: p,
                                editIndex: index,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _patients.removeAt(index);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),

        // Confirm booking button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _confirmBooking,
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

        const SizedBox(height: 12),
      ],
    );
  }

  // Show confirmation dialog with all details, and clear data only if user confirms
  void _confirmBooking() {
    if (_patients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one patient')),
      );
      return;
    }

    final dateText = selectedDate != null
        ? DateFormat('dd MMMM yyyy').format(selectedDate!)
        : 'Not selected';
    final timeText = selectedTime ?? 'Not selected';

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Confirm Booking'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (doctor != null)
                  Text(
                    doctor!.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 6),
                Text('$dateText at $timeText'),
                const SizedBox(height: 12),
                Text(
                  'Patients (${_patients.length}):',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ..._patients.map(
                  (p) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('• ${p.name}, ${p.age} yrs • ${p.mobile}'),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Booking confirmed — clear everything in memory only
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking confirmed!')),
                );
                context.go('/patient/dashboard/my_appointment');
                // _resetBookingForm();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Widget docorProfileCard(BuildContext ctx) {
    return Center(
      child: Container(
        width: 900.w,
        height: 430.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0XFF745EDD), width: 0.5.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.local_hospital_sharp),
            ),
            Container(height: 0.5.h, width: 900.w, color: Color(0XFF000000)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                height: 300.h,
                width: 850.w,
                child: Row(
                  children: [
                    // profile image
                    SizedBox(
                      width: 300.h,
                      height: 400.h,
                      child: ProfileImage(
                        imagePath: "assets/images/doctor_img.png",
                        isCircle: false,
                        size: 195,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 15.r),
                      child: SizedBox(
                        width: 550.w,
                        height: 400.h,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DoctorName(name: 'Dr. Sandeep Singh'),

                            SizedBox(height: 20.w),
                            Row(
                              children: [
                                DoctorInfoRow(
                                  icon: Icons.star,
                                  text: '29 years experience overall',
                                ),
                                // SizedBox(width: 15.w),
                                DoctorInfoRow(
                                  icon: Icons.location_on,
                                  text: 'Chembur, Mumbai, 400071',
                                ),
                              ],
                            ),
                            SizedBox(height: 25.w),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.home, size: 30.r),
                                SizedBox(width: 5.w),
                                Container(
                                  width: 262.w,
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.r),
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0XFF745EDD),
                                    ),
                                  ),
                                  child: Center(
                                    child: ClinicDropdown(
                                      selectedClinic:
                                          'Smile Multi Speciality Clinic',
                                      clinics: [
                                        'Smile Multi Speciality Clinic',
                                        'Other Clinic',
                                      ],
                                      onChanged: (value) {},
                                      fontSize: 16,
                                      iconSize: 30,
                                      itemHeight: 60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 60.w),

                            Row(
                              children: [
                                DateTimeCard(
                                  icon: Icons.calendar_month,
                                  value: "05 September 2025",
                                ),
                                SizedBox(width: 50.w),
                                DateTimeCard(
                                  icon: Icons.watch_sharp,
                                  value: "AT 10:00 AM",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 50.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.refresh, color: Color(0XFF745EDD)),
                  Text(
                    'Change Date & Time',
                    style: TextStyle(color: Color(0XFF745EDD)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
