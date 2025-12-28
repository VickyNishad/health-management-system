import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  // Values you want to override
  final double iconSize;
  final double spaceWidth;
  final double fontSize;

  const DoctorInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 20,
    this.spaceWidth = 5,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: iconSize.sp),
          SizedBox(width: spaceWidth.w),
          Expanded(
            child: Text(
              text,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: fontSize.sp),
            ),
          ),
        ],
      ),
    );
  }
}
