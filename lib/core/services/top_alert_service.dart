import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../enums/alert_type.dart';

class TopAlertService {
  // Singleton
  static final TopAlertService _instance = TopAlertService._internal();
  factory TopAlertService() => _instance;
  TopAlertService._internal();

  OverlayEntry? _overlayEntry;
  bool _isShowing = false;
  final List<_AlertData> _queue = [];

  /// Show top alert message
  void show({
    required BuildContext context,
    required String message,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    final alertData = _AlertData(
      message: message,
      type: type,
      duration: duration,
    );
    _queue.add(alertData);

    if (!_isShowing) {
      _showNext(context);
    }
  }

  void _showNext(BuildContext context) {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    _isShowing = true;
    final alertData = _queue.removeAt(0);

    Color backgroundColor;
    IconData iconData;

    switch (alertData.type) {
      case AlertType.success:
        backgroundColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case AlertType.error:
        backgroundColor = Colors.red;
        iconData = Icons.error;
        break;
      case AlertType.warning:
        backgroundColor = Colors.orange;
        iconData = Icons.warning;
        break;
      case AlertType.info:
      // ignore: unreachable_switch_default
      default:
        backgroundColor = Colors.black87;
        iconData = Icons.info;
        break;
    }

    final topPadding = MediaQuery.of(context).padding.top + 8.h;
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamic width based on device type
    double containerWidth;
    double containerHeight;

    if (screenWidth >= 1200) {
      // Web
      containerWidth = screenWidth * 0.25;
      containerHeight = 50.h;
    } else if (screenWidth >= 600) {
      // Tablet
      containerWidth = screenWidth * 0.4;
      containerHeight = 40.h;
    } else {
      // Mobile
      containerWidth = screenWidth * 0.6;
      containerHeight = 30.h;
    }

    _overlayEntry = OverlayEntry(
      builder: (_) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: -1.0, end: 0.0),
          duration: const Duration(milliseconds: 250),
          builder: (context, value, child) {
            return Positioned(
              top: topPadding + value * containerHeight,
              left: (screenWidth - containerWidth) / 2,
              child: child!,
            );
          },
          child: Material(
            color: Colors.transparent,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: 1.0,
              child: Container(
                width: containerWidth,
                height: containerHeight,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.r,
                      offset: Offset(0, 3.h),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      iconData,
                      color: Colors.white,
                      size: containerHeight * 0.4,
                    ),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Text(
                        alertData.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: containerHeight * 0.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(alertData.duration, () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _showNext(context);
    });
  }
}

class _AlertData {
  final String message;
  final AlertType type;
  final Duration duration;

  _AlertData({
    required this.message,
    required this.type,
    required this.duration,
  });
}
