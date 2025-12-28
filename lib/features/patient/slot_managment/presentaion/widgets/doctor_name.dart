import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorName extends StatelessWidget {
  final String name;
  final double fontSize;

  const DoctorName({
    super.key,
    required this.name,
    this.fontSize = 22, // default value
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: fontSize.sp, fontWeight: FontWeight.bold),
    );
  }
}
