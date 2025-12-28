import '../models/menu_item_model.dart';

class MenuConfigResponse {
  final List<MenuItemModel> allMenus;
  final Map<String, List<String>> roleDefaultPermissions;

  MenuConfigResponse({
    required this.allMenus,
    required this.roleDefaultPermissions,
  });

  factory MenuConfigResponse.fromJson(Map<String, dynamic> json) {
    return MenuConfigResponse(
      allMenus: (json['allMenus'] as List)
          .map((m) => MenuItemModel.fromJson(m))
          .toList(),
      roleDefaultPermissions: Map<String, List<String>>.from(
        (json['roleDefaultPermissions'] as Map).map(
          (k, v) => MapEntry(k, List<String>.from(v)),
        ),
      ),
    );
  }
}
