import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/components/prifile_image.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/description_Info.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/doctor_info_row.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/doctor_name.dart';
import 'package:medicque_app/features/patient/slot_managment/presentaion/widgets/time_selection.dart';

import '../../../../dashboard/data/models/doctor_slot.dart';
import '../../widgets/clinic_dropdown.dart';
import '../../widgets/slot_date_selector.dart';

class WebSlot extends StatefulWidget {
  DoctorSlotModel? doctor;
  WebSlot({super.key, required this.doctor});

  @override
  State<WebSlot> createState() => _WebSlotState();
}

class _WebSlotState extends State<WebSlot> {
  int selectedDateIndex = 0;
  int? selectedSlotId; // Track selected slot ID

  @override
  Widget build(BuildContext context) {
    // print(selectedDate.day);
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    final selectedDate = widget.doctor!.dates[selectedDateIndex];
    // print(selectedDate.day);
    return SingleChildScrollView(
      child: Column(
        children: [
          docorProfileCard(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: slotDateSelector(context, (value) {
              setState(() {
                selectedDateIndex = value;
                selectedSlotId = null;
              });
            }),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            child: TimeSelection(
              date: selectedDate,
              selectedSlotId: selectedSlotId,
              onSelectedSlot: (value) {
                print('id $value');
                setState(() {
                  // selectedSlotId = value;
                  context.go(
                    '/patient/dashboard/doctor_appointment/slot-confirmation',
                  );
                });
              },
            ),
          ),

          // NeumorphicButton(),
          // Container(
          //   width: 200,
          //   height: 200,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[300], // Background color of the container
          //     borderRadius: BorderRadius.circular(15.0),
          //     boxShadow: [
          //       // Shadow 1: The dark shadow (simulates the bottom/right cast shadow)
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.2),
          //         offset: const Offset(6, 6),
          //         blurRadius: 10.0,
          //         spreadRadius: 1.0,
          //       ),
          //       // Shadow 2: The light shadow (simulates the top/left highlight)
          //       BoxShadow(
          //         color: Colors.white,
          //         offset: const Offset(-6, -6),
          //         blurRadius: 10.0,
          //         spreadRadius: 1.0,
          //       ),
          //     ],
          //   ),
          //   child: const Center(child: Text('3D Effect')),
          // ),
        ],
      ),
    );
  }

  Widget docorProfileCard(BuildContext ctx) {
    return Center(
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
              padding: EdgeInsets.only(left: 15),
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
                              selectedClinic: 'Smile Multi Speciality Clinic',
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
                    SizedBox(height: 40.w),
                    Expanded(
                      child: DescriptionInfo(
                        description:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industry's \nstandard dummy text ever since the 1500s",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget slotDateSelector(BuildContext ctx, ValueChanged<int> onDateSelected) {
    return SlotDateSelector(
      doctorSlotModel: widget.doctor,
      onDateSelected: onDateSelected,
      containerWidth: 170,
      containerHeight: 55,
      dayFontSize: 15,
      slotFontSize: 13,
      selectedColor: Color(0XFF745EDD),
      unselectedColor: Colors.white,
      borderColor: Color(0XFF745EDD),
      borderRadius: 10,
      showScrollButtons: true,
    );
  }
}
