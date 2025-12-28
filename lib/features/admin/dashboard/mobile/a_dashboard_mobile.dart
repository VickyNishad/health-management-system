import 'package:flutter/material.dart';
import '../../../../core/config/menu_config_response.dart';
import '../../../../core/services/assets_json_loader.dart';
import '../../../../core/services/menu_service.dart';
import '../../../../core/utils/app_roles.dart';
import '../../../../layouts/app_portal_layout.dart';

class AdminDashboardMobile extends StatelessWidget {
  const AdminDashboardMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: AssetJsonLoader.loadJsonAsset('menu_config.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Failed to load menu config'));
        }

        // ✅ JSON is ready
        final config = MenuConfigResponse.fromJson(snapshot.data!);

        final menu = MenuService.getMenuForUser(
          role: AppRole.admin,
          apiPermissions: [], // pass API permissions
          config: config,
        );

        return AppPortalLayout(
          role: AppRole.admin,
          menuItems: menu,
          showMenuInAppBar: false,
          child: const Center(child: Text('Doctor Mobile Dashboard')),
        );
      },
    );
  }
}
