import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/config/menu_config_response.dart';
import '../../../../../../core/services/assets_json_loader.dart';
import '../../../../../../core/services/menu_service.dart';
import '../../../../../../core/utils/app_roles.dart';
import '../../../../../../layouts/app_portal_layout.dart';
import '../../../data/models/doctor_booking.dart';
import '../../../data/models/patient_info.dart';
import '../../widgets/add_patient_form.dart';

class PTabletDoctorAppointmentBooking extends StatefulWidget {
  const PTabletDoctorAppointmentBooking({super.key});

  @override
  State<PTabletDoctorAppointmentBooking> createState() =>
      _PTabletDoctorAppointmentBookingState();
}

class _PTabletDoctorAppointmentBookingState
    extends State<PTabletDoctorAppointmentBooking>
    with AutomaticKeepAliveClientMixin {
  DoctorBooking? doctor;

  // initial appointment values (from json)
  DateTime? selectedDate;
  String? selectedTime;

  // protect against re-loading / resetting on rebuilds
  bool _isLoaded = false;

  // Patient list stored in-memory for this screen
  final List<PatientInfo> _patients = [];

  // Controllers for the temporary bottom-sheet form (reused)
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();

  // fallback image from uploaded file (developer-provided)
  // This path exists in the conversation assets and will be used if doctor.imageUrl is empty.
  final String _fallbackImagePath =
      '/mnt/data/783e7a16-7e85-419e-a954-6771d2dde467.png';

  @override
  void initState() {
    super.initState();
    loadDataOnce();
  }

  /// Loads doctor booking JSON once. Uses _isLoaded to avoid reloading on rebuilds.
  Future<void> loadDataOnce() async {
    if (_isLoaded) return;
    _isLoaded = true;

    try {
      final Map<String, dynamic> json = await AssetJsonLoader.loadJsonAsset(
        'booking.json',
      );

      doctor = DoctorBooking.fromJson(json);

      // parse date/time safely
      try {
        selectedDate = DateFormat('yyyy-MM-dd').parse(doctor!.appointmentDate);
      } catch (_) {
        selectedDate = null;
      }
      selectedTime = doctor!.appointmentTime;
    } catch (e) {
      // If loading fails, doctor stays null. The UI will show a friendly message.
      doctor = null;
    }

    if (mounted) setState(() {});
  }

  // Keep state alive across tab switches / rebuilds
  @override
  bool get wantKeepAlive => true;

  // Helper: build image using either doctor.imageUrl or fallback local file
  Widget _buildImage(String? imageUrl) {
    final candidate = (imageUrl == null || imageUrl.isEmpty)
        ? _fallbackImagePath
        : imageUrl;

    try {
      if (candidate.startsWith('/') || candidate.startsWith('file://')) {
        final file = File(candidate);
        if (file.existsSync()) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(file, width: 140, height: 140, fit: BoxFit.cover),
          );
        }
      }
    } catch (_) {}

    // fallback to network image (if candidate is URL) or placeholder
    if (candidate.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          candidate,
          width: 140,
          height: 140,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.person, size: 72, color: Colors.grey),
    );
  }

  // Date picker
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  // Time picker
  Future<void> _pickTime() async {
    final initial = _stringToTimeOfDay(selectedTime ?? '10:00 AM');
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (timeOfDay != null) {
      final formatted = DateFormat.jm().format(
        DateTime(0, 1, 1, timeOfDay.hour, timeOfDay.minute),
      );
      setState(() => selectedTime = formatted);
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

  // // Opens a modal bottom sheet to add a patient (Name, Age, Mobile) // this code we can use in future
  // void _openAddPatientSheet1({PatientInfo? edit, int? editIndex}) {
  //   // if editing, prefill controllers
  //   if (edit != null) {
  //     _nameCtrl.text = edit.name;
  //     _ageCtrl.text = edit.age;
  //     _mobileCtrl.text = edit.mobile;
  //   } else {
  //     _nameCtrl.clear();
  //     _ageCtrl.clear();
  //     _mobileCtrl.clear();
  //   }

  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     builder: (ctx) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           left: 20,
  //           right: 20,
  //           top: 20,
  //           bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
  //         ),
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 edit == null ? "Add Patient" : "Edit Patient",
  //                 style: const TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               const SizedBox(height: 14),
  //               TextField(
  //                 controller: _nameCtrl,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Full Name',
  //                   border: OutlineInputBorder(),
  //                 ),
  //               ),
  //               const SizedBox(height: 12),
  //               TextField(
  //                 controller: _ageCtrl,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Age',
  //                   border: OutlineInputBorder(),
  //                 ),
  //                 keyboardType: TextInputType.number,
  //               ),
  //               const SizedBox(height: 12),
  //               TextField(
  //                 controller: _mobileCtrl,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Mobile Number',
  //                   border: OutlineInputBorder(),
  //                 ),
  //                 keyboardType: TextInputType.phone,
  //               ),
  //               const SizedBox(height: 18),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: OutlinedButton(
  //                       onPressed: () {
  //                         Navigator.of(ctx).pop();
  //                       },
  //                       child: const Text('Cancel'),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 12),
  //                   Expanded(
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         final name = _nameCtrl.text.trim();
  //                         final age = _ageCtrl.text.trim();
  //                         final mobile = _mobileCtrl.text.trim();

  //                         if (name.isEmpty || age.isEmpty || mobile.isEmpty) {
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                             const SnackBar(
  //                               content: Text('Fill all required fields'),
  //                             ),
  //                           );
  //                           return;
  //                         }

  //                         final newPatient = PatientInfo(
  //                           name: name,
  //                           age: age,
  //                           mobile: mobile,
  //                         );

  //                         if (editIndex != null &&
  //                             editIndex >= 0 &&
  //                             editIndex < _patients.length) {
  //                           // replace existing
  //                           _patients[editIndex] = newPatient;
  //                         } else {
  //                           // add new
  //                           _patients.add(newPatient);
  //                         }

  //                         setState(() {});
  //                         Navigator.of(ctx).pop();
  //                       },
  //                       child: Text(edit == null ? 'Add Patient' : 'Save'),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Reset everything (clear fields and patient list)
  void _resetBookingForm() {
    _patients.clear();
    _nameCtrl.clear();
    _ageCtrl.clear();
    _mobileCtrl.clear();
    selectedDate = null;
    selectedTime = null;

    // Do not persist anything to disk
    setState(() {});
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
                _resetBookingForm();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final state = GoRouterState.of(context);
    // final name = state.uri.queryParameters['name'];
    // print(name);
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
          child: _buildUI(context),
        );
      },
    );
  }

  Widget _buildUI(BuildContext context) {
    final dateLabel = selectedDate != null
        ? DateFormat('dd MMM yyyy').format(selectedDate!)
        : 'Select Date';
    final timeLabel = selectedTime ?? 'Select Time';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Column(
        children: [
          // Header: doctor info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(doctor!.imageUrl),
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
                    const SizedBox(height: 8),
                    Text(doctor!.experience),
                    const SizedBox(height: 6),
                    Text(doctor!.location),
                    const SizedBox(height: 6),
                    Text(doctor!.clinic),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // description
          if (doctor!.description.isNotEmpty)
            Text(
              doctor!.description,
              style: const TextStyle(color: Colors.black87),
            ),

          const SizedBox(height: 16),

          // Date & Time pickers
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

          // Add Patient button / Patients header
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
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () => _openAddPatientSheet(
                                  edit: p,
                                  editIndex: index,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
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
      ),
    );
  }
}
