import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/prifile_image.dart';

class ThreeStepCard extends StatefulWidget {
  final String imgPath;
  final String title;
  final int number;
  final String subtitle;

  // --- Custom values you can pass ---
  final double? imageSize; // Circle image size
  final double? titleFontSize; // Title
  final double? subtitleFontSize; // Subtitle font
  final double? subtitleWidth; // Text box width

  const ThreeStepCard({
    super.key,
    required this.imgPath,
    required this.title,
    required this.number,
    required this.subtitle,
    this.imageSize,
    this.titleFontSize,
    this.subtitleFontSize,
    this.subtitleWidth,
  });

  @override
  State<ThreeStepCard> createState() => _ThreeStepCardState();
}

class _ThreeStepCardState extends State<ThreeStepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Responsive defaults (you can override)
    double imageSize = widget.imageSize ?? 120.w;
    double titleSize = widget.titleFontSize ?? 16.sp;
    double subtitleSize = widget.subtitleFontSize ?? 13.sp;
    double subtitleWidth = widget.subtitleWidth ?? 240.w;

    double hoverScale = _isHovered ? 1.05 : 1.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.identity()..scale(hoverScale),
        child: Column(
          children: [
            ProfileImage(
              imagePath: widget.imgPath,
              isCircle: true,
              size: imageSize,
            ),

            SizedBox(height: 12.h),

            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            ),

            SizedBox(height: 6.h),

            SizedBox(
              width: subtitleWidth,
              child: Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: subtitleSize,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
