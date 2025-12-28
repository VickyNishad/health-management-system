import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestActionButtons extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RequestActionButtons({
    super.key,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: onAccept,
          icon: Icon(Icons.check, color: Colors.green, size: 18.sp),
          label: Text(
            "Accept",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        const Text("|", style: TextStyle(color: Colors.grey)),
        SizedBox(width: 8.w),
        TextButton.icon(
          onPressed: onReject,
          icon: Icon(Icons.close, color: Colors.red, size: 18.sp),
          label: Text(
            "Reject",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
