import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SquireTile extends StatelessWidget {
  String imagePath;
  VoidCallback onTap;
  // ignore: non_constant_identifier_names
  SquireTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey[200],
        ),
        child: Image.asset(imagePath, height: 35.h),
      ),
    );
  }
}
