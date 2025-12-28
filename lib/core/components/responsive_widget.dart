import 'package:flutter/material.dart';
import '../responsive/device_type.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final dt = getDeviceType(context);
    switch (dt) {
      case DeviceType.desktop:
        return desktop;
      case DeviceType.tablet:
        return tablet;
      default:
        return mobile;
    }
  }
}
