import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepInfoCardImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const StepInfoCardImage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The step IMAGE
        Image.asset(imagePath, width: 75.w, height: 75.w, fit: BoxFit.contain),

        SizedBox(height: 15.h),

        // Title
        Text(
          title,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 8.h),

        // Description
        SizedBox(
          width: 220.w,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
