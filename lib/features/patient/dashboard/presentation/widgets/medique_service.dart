import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediqueService extends StatelessWidget {
  final String title;
  final String assetImage;
  final VoidCallback onTap;

  /// Added optional width & height
  final double? width;
  final double? height;
  final double? imgWidth;
  final double? imgHeight;

  final double borderRadius;
  final Color backgroundColor;
  final Color footerColor;

  const MediqueService({
    super.key,
    required this.title,
    required this.assetImage,
    required this.onTap,
    this.width,
    this.height,
    this.imgHeight,
    this.imgWidth,
    this.borderRadius = 10,
    this.backgroundColor = Colors.white,
    this.footerColor = const Color(0xFF7E57C2),
  });

  @override
  Widget build(BuildContext context) {
    // Default sizes so widget NEVER breaks
    final double finalWidth = (width ?? 80).w;
    final double finalHeight = (height ?? 100).h;
    final double finalImgWidth = (imgWidth ?? 150).w;
    final double finalImgHeight = (imgHeight ?? 180).h;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: SizedBox(
        width: finalWidth,
        height: finalHeight,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius.r),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius.r),
              border: Border.all(color: Colors.grey.shade300, width: 1.w),
            ),
            child: Column(
              children: [
                // Image section
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0.w),
                    child: Image.asset(
                      assetImage,
                      fit: BoxFit.contain,
                      width: finalImgWidth,
                      height: finalImgHeight,
                    ),
                  ),
                ),

                // Footer section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: footerColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(borderRadius.r),
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
