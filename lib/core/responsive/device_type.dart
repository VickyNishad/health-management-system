import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  if (w >= 1024) return DeviceType.desktop;
  if (w >= 600) return DeviceType.tablet;
  return DeviceType.mobile;
}
