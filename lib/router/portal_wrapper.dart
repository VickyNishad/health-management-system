import 'package:flutter/material.dart';
import 'package:medicque_app/core/widgets/menu_consumer.dart' show MenuConsumer;

import '../core/services/menu_service.dart';
import '../core/utils/app_roles.dart';
import '../layouts/app_portal_layout.dart';

class PortalWrapper extends StatelessWidget {
  final Widget child;
  final AppRole appRole;
  final bool showMenuInAppBar;
  const PortalWrapper({
    super.key,
    required this.child,
    required this.appRole,
    required this.showMenuInAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return MenuConsumer(
      loading: const Center(child: CircularProgressIndicator()),
      error: (ctx, msg) => Center(child: Text('Error: $msg')),
      builder: (context, config) {
        final menu = MenuService.getMenuForUser(
          role: appRole,
          apiPermissions: const [],
          config: config,
        );

        return AppPortalLayout(
          role: appRole,
          menuItems: menu,
          showMenuInAppBar: showMenuInAppBar,
          child: child,
        );
      },
    );
  }
}
