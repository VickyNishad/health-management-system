import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../dashboard/data/models/doctor_slot.dart';

class TimeSelection extends StatelessWidget {
  final DateModel date;
  final int? selectedSlotId;
  final ValueChanged<int> onSelectedSlot;

  // Customizable values
  final double slotContainerWidth;
  final double slotContainerHeight;
  final double borderRadius;
  final double sectionSpacing;
  final double slotSpacing;
  final Color primaryColor;
  final Color bookedColor;
  final Color selectedColor;
  final Color textColor;
  final Color dividerColor;
  final double timePeriodFontize;

  const TimeSelection({
    super.key,
    required this.date,
    this.selectedSlotId,
    required this.onSelectedSlot,
    this.slotContainerWidth = 106,
    this.slotContainerHeight = 38,
    this.borderRadius = 8,
    this.sectionSpacing = 24,
    this.slotSpacing = 10,
    this.primaryColor = const Color(0xFF745EDD),
    this.bookedColor = Colors.grey,
    this.selectedColor = const Color(0xFF7367F0),
    this.textColor = const Color(0xFF000000),
    this.dividerColor = const Color(0xFF745EDD),
    this.timePeriodFontize = 18,
  });

  IconData _getIconForSection(String section) {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: date.timeSections.entries.map((entry) {
          final sectionName = entry.key;
          final slots = entry.value;

          return Container(
            margin: EdgeInsets.only(bottom: sectionSpacing.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius.r),
              border: Border.all(color: primaryColor, width: 0.5.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Row(
                    children: [
                      Icon(
                        _getIconForSection(sectionName),
                        color: primaryColor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        sectionName,
                        style: TextStyle(
                          fontSize: timePeriodFontize.sp,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider
                Container(height: 0.5.h, color: dividerColor),
                SizedBox(height: 12.h),

                // Slots
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Wrap(
                    spacing: slotSpacing.w,
                    runSpacing: slotSpacing.h,
                    children: slots.map((slot) {
                      final isBooked = slot.status == "Booked";
                      final isSelected = selectedSlotId == slot.id;

                      Color bgColor = Colors.white;
                      Color borderColor = primaryColor;

                      if (isBooked) {
                        bgColor = bookedColor;
                        borderColor = bookedColor;
                      } else if (isSelected) {
                        bgColor = selectedColor;
                        borderColor = selectedColor;
                      }

                      return GestureDetector(
                        onTap: isBooked ? null : () => onSelectedSlot(slot.id),
                        child: Container(
                          width: slotContainerWidth.w,
                          height: slotContainerHeight.h,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(borderRadius.r),
                            border: Border.all(
                              color: borderColor,
                              width: 0.5.w,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            slot.time,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
