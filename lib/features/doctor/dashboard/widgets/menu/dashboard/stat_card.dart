import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String statusText;
  final IconData icon;
  final Color statusColor;
  final bool isUp;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.statusText,
    required this.icon,
    required this.statusColor,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 24.w : 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatTextSection(
            title: title,
            value: value,
            statusText: statusText,
            statusColor: statusColor,
            isUp: isUp,
            isDesktop: isDesktop,
          ),
          Icon(icon, size: isDesktop ? 32.sp : 26.sp, color: Colors.blueGrey),
        ],
      ),
    );
  }
}

class _StatTextSection extends StatelessWidget {
  final String title;
  final String value;
  final String statusText;
  final Color statusColor;
  final bool isUp;
  final bool isDesktop;

  const _StatTextSection({
    required this.title,
    required this.value,
    required this.statusText,
    required this.statusColor,
    required this.isUp,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
            fontSize: isDesktop ? 14.sp : 12.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isDesktop ? 26.sp : 22.sp,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Icon(
              isUp ? Icons.arrow_upward : Icons.arrow_downward,
              color: statusColor,
              size: 14.sp,
            ),
            SizedBox(width: 4.w),
            Text(
              statusText,
              style: TextStyle(
                color: statusColor,
                fontSize: isDesktop ? 12.sp : 11.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
