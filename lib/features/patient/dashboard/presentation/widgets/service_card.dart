import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/prifile_image.dart';

class ServiceCard extends StatefulWidget {
  final String imagePath;
  final IconData icon;
  final String text;
  final double containerWidth;
  final double containerHeight;
  final double imageSize;
  final double footerWidth;
  final double footerHeight;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.icon,
    required this.text,
    required this.containerWidth,
    required this.containerHeight,
    required this.imageSize,
    required this.footerWidth,
    required this.footerHeight,
    this.onTap,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Hover animation scale factor
    final hoverScale = _isHovered ? 1.05 : 1.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(hoverScale),
          width: widget.containerWidth,
          height: widget.containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFF8A38F5)),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon(widget.icon, size: 40.sp, color: Colors.deepPurple),
              ProfileImage(
                imagePath: widget.imagePath,
                isCircle: false,
                size: widget.imageSize,
              ),
              Container(
                height: widget.footerHeight,
                width: widget.footerWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFF745EDD),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11.3.r),
                    bottomRight: Radius.circular(11.3.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 4.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
