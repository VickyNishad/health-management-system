import 'package:flutter/material.dart';

import '../core/components/common_appbar.dart';
import '../core/components/common_drawer.dart';
import '../core/models/menu_item_model.dart';
import '../core/responsive/device_type.dart';
import '../core/utils/app_roles.dart';

class AppPortalLayout extends StatelessWidget {
  final Widget child;
  final AppRole role;
  final List<MenuItemModel> menuItems;
  final PreferredSizeWidget? customAppBar;
  final Widget? customDrawer;
  final bool useDefaultAppBar;
  final bool useDefaultDrawer;
  final bool showMenuInAppBar; // for patient web

  const AppPortalLayout({
    super.key,
    required this.child,
    required this.role,
    required this.menuItems,
    this.customAppBar,
    this.customDrawer,
    this.useDefaultAppBar = true,
    this.useDefaultDrawer = true,
    this.showMenuInAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    final dt = getDeviceType(context);
    // final isMobile = dt == DeviceType.mobile;
    // final isTablet = dt == DeviceType.tablet;
    final isDesktop = dt == DeviceType.desktop;

    final resolvedDrawer =
        customDrawer ??
        (useDefaultDrawer
            ? CommonDrawer(menuItems: menuItems, isPermanent: false)
            : null);

    final resolvedAppBar =
        customAppBar ??
        (useDefaultAppBar
            ? CommonAppBar(
                title: '',
                actionsMenu: menuItems,
                showMenuInAppBar: !isDesktop ? false : showMenuInAppBar,
              )
            : null);

    // PATIENT behavior:
    if (role == AppRole.patient) {
      if (isDesktop) {
        // web: show appbar with menu buttons; no drawer
        return Scaffold(appBar: resolvedAppBar, body: child);
      } else {
        // mobile/tablet: show drawer, appbar optional
        return Scaffold(
          appBar: resolvedAppBar,
          drawer: resolvedDrawer,
          body: child,
        );
      }
    }

    // DOCTOR/ADMIN behavior:
    if (role == AppRole.admin || role == AppRole.doctor) {
      if (isDesktop) {
        // permanent drawer
        return Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 260,
                child: CommonDrawer(menuItems: menuItems, isPermanent: true),
              ),
              Expanded(child: child),
            ],
          ),
        );
      } else {
        // tablet/mobile: normal drawer + appbar
        return Scaffold(
          appBar: resolvedAppBar,
          drawer: resolvedDrawer,
          body: child,
        );
      }
    }

    // default fallback
    return Scaffold(
      appBar: resolvedAppBar,
      drawer: resolvedDrawer,
      body: child,
    );
  }
}
