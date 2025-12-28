import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicque_app/core/components/prifile_image.dart';

import '../../../../dashboard/data/models/doctor_slot.dart';
import '../../widgets/clinic_dropdown.dart';
import '../../widgets/doctor_info_row.dart';
import '../../widgets/doctor_name.dart';
import '../../widgets/slot_date_selector.dart';
import '../../widgets/time_selection.dart';

class MobileSlot extends StatefulWidget {
  DoctorSlotModel? doctor;
  MobileSlot({super.key, required this.doctor});

  @override
  State<MobileSlot> createState() => _MobileSlotState();
}

class _MobileSlotState extends State<MobileSlot> {
  int selectedDateIndex = 0;
  int? selectedSlotId; // Track selected slot ID

  // @override
  // Widget build(BuildContext context) {
  //   return MenuConsumer(
  //     loading: const Center(child: CircularProgressIndicator()),
  //     error: (ctx, msg) => Center(child: Text('Error: $msg')),
  //     builder: (context, config) {
  //       final menu = MenuService.getMenuForUser(
  //         role: AppRole.patient,
  //         apiPermissions: const [],
  //         config: config,
  //       );

  //       return AppPortalLayout(
  //         role: AppRole.patient,
  //         menuItems: menu,
  //         showMenuInAppBar: false,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 5),
  //           child: _buildUI(context),
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    // print(selectedDate.day);
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext ctx) {
    final selectedDate = widget.doctor!.dates[selectedDateIndex];
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            docorProfileCard(ctx),
            slotDateSelector(context, (value) {
              setState(() {
                selectedDateIndex = value;
                selectedSlotId = null;
              });
            }),

            TimeSelection(
              date: selectedDate,
              selectedSlotId: selectedSlotId,
              slotContainerWidth: 100,
              slotContainerHeight: 28,
              timePeriodFontize: 14,
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
          ],
        ),
      ),
    );
  }

  Widget slotDateSelector(BuildContext ctx, ValueChanged<int> onDateSelected) {
    return SlotDateSelector(
      doctorSlotModel: widget.doctor,
      onDateSelected: onDateSelected,
      containerWidth: 120,
      containerHeight: 38,
      dayFontSize: 12,
      slotFontSize: 10,
      selectedColor: Color(0XFF745EDD),
      unselectedColor: Colors.white,
      borderColor: Color(0XFF745EDD),
      borderRadius: 10,
      showScrollButtons: true,
    );
  }

  Widget docorProfileCard(BuildContext ctx) {
    return Center(
      child: SizedBox(
        height: 140.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile image
            SizedBox(
              width: 110.h,
              height: 110.h,
              child: ProfileImage(
                imagePath: "assets/images/doctor_img.png",
                isCircle: false,
                size: 100,
              ),
            ),
            // Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 5.r),
              child: SizedBox(
                width: 210.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorName(name: 'Dr. Sandeep Singh', fontSize: 16),
                    // Spacer(),
                    SizedBox(height: 5.w),
                    DoctorInfoRow(
                      icon: Icons.star,
                      text: '29 years experience overall',
                      fontSize: 12,
                      iconSize: 20,
                    ),
                    SizedBox(height: 5.w),
                    DoctorInfoRow(
                      icon: Icons.location_on,
                      text: 'Chembur, Mumbai, 400071',
                      fontSize: 12,
                      iconSize: 20,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 20.sp),
                        SizedBox(width: 5.w),
                        Container(
                          width: 180.w,
                          height: 25.h,
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
                              fontSize: 12,
                              iconSize: 16,
                              itemHeight: 30,
                              dropdownWidth: 200,
                              horizontalPadding: 2,
                            ),
                          ),
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
    );
  }
}
