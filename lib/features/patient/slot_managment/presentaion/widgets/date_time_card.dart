import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeCard extends StatelessWidget {
  final String value;
  final IconData icon;
  final double boxWidth;
  final double boxHeight;
  final double iconSize;
  final Color iconColors;
  final double fontSize;
  final Color fontColor;

  const DateTimeCard({
    super.key,
    required this.value,
    required this.icon,
    this.boxWidth = 248,
    this.boxHeight = 55,
    this.iconSize = 40,
    this.iconColors = Colors.black,
    this.fontSize = 16,
    this.fontColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth.w,
      height: boxHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1.r, color: Color(0XFF745EDD)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: iconSize.r, color: iconColors),

            SizedBox(width: 10.w),

            Text(
              value,
              style: TextStyle(
                fontSize: fontSize.sp,
                color: fontColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
