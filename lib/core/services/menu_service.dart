import '../config/menu_config_response.dart';
import '../models/menu_item_model.dart';
import '../utils/app_roles.dart';

class MenuService {
  static List<MenuItemModel> getMenuForUser({
    required AppRole role,
    required List<String> apiPermissions,
    required MenuConfigResponse config,
  }) {
    // 1️⃣ Role default permissions from API
    final defaultPerms = config.roleDefaultPermissions[role.name] ?? [];

    // 2️⃣ Merge default + API permissions
    final allUserPermissions = {...defaultPerms, ...apiPermissions};

    // 3️⃣ Filter menus
    return config.allMenus.where((menu) {
      final roleAllowed = menu.allowedRoles?.contains(role.name.toLowerCase());
      final permissionAllowed = allUserPermissions.contains(menu.permissionKey);
      return roleAllowed! && permissionAllowed;
    }).toList();
  }
}
