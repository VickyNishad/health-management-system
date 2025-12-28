// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionInfo extends StatelessWidget {
  final String description;

  final double fontSize;
  final double lineHeight;

  const DescriptionInfo({
    super.key,
    required this.description,
    this.fontSize = 14,
    this.lineHeight = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: FontWeight.normal,
        height: lineHeight,
      ),
      textAlign: TextAlign.start,
      maxLines: null,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
