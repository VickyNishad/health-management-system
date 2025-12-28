// import 'menu_item_model.dart';

// class UserRoleResponse {
//   final String role;
//   final List<String> customPermissions;
//   final List<MenuItemModel> menus;
//   final Map<String, List<String>> rolePermissions;

//   UserRoleResponse({
//     required this.role,
//     required this.customPermissions,
//     required this.menus,
//     required this.rolePermissions,
//   });

//   factory UserRoleResponse.fromJson(Map<String, dynamic> json) {
//     return UserRoleResponse(
//       role: json["role"] ?? "",

//       customPermissions: json["customPermissions"] != null
//           ? List<String>.from(json["customPermissions"])
//           : [],

//       menus: (json['menus'] as List)
//           .map((m) => MenuItemModel.fromJson(m))
//           .toList(),

//       rolePermissions: (json["rolePermissions"] as Map<String, dynamic>).map(
//         (key, value) => MapEntry(key, List<String>.from(value as List)),
//       ),
//     );
//   }
// }
