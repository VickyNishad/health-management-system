import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicDropdown extends StatelessWidget {
  final String selectedClinic;
  final List<String> clinics;
  final ValueChanged<String?> onChanged;

  // Customizable values
  final double fontSize;
  final double iconSize;
  final double itemHeight;
  final double horizontalPadding;
  final double dropdownWidth;

  const ClinicDropdown({
    super.key,
    required this.selectedClinic,
    required this.clinics,
    required this.onChanged,
    this.fontSize = 16,
    this.iconSize = 22,
    this.itemHeight = 45,
    this.horizontalPadding = 8,
    this.dropdownWidth = 250, // max width of dropdown items
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedClinic,
      iconSize: iconSize.sp,
      underline: Container(),
      isExpanded: true, // important for flexible width
      onChanged: onChanged,

      items: clinics.map((clinic) {
        return DropdownMenuItem<String>(
          value: clinic,
          child: SizedBox(
            width: dropdownWidth.w, // limit item width
            child: Padding(
              padding: EdgeInsets.only(left: 5.r),
              child: Text(
                clinic,
                style: TextStyle(fontSize: fontSize.sp),
                maxLines: 2, // wrap into 2 lines
                overflow: TextOverflow.ellipsis, // show ... if too long
                softWrap: true,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
