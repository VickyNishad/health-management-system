// import 'package:flutter/material.dart';

// class MenuItemModel {
//   final String title;
//   final String iconName; // <— comes from API
//   final String route;
//   final String requiredPermission;

//   MenuItemModel({
//     required this.title,
//     required this.iconName,
//     required this.route,
//     required this.requiredPermission,
//   });

//   // 🔥 Convert JSON → Model
//   factory MenuItemModel.fromJson(Map<String, dynamic> json) {
//     return MenuItemModel(
//       title: json['title'],
//       iconName: json['icon'], // API sends icon name e.g. "home"
//       route: json['route'],
//       requiredPermission: json['requiredPermission'],
//     );
//   }

//   // 🔥 Convert iconName → IconData
//   IconData get icon {
//     switch (iconName) {
//       case "home":
//         return Icons.home;
//       case "dashboard":
//         return Icons.dashboard;
//       case "settings":
//         return Icons.settings;
//       case "profile":
//         return Icons.person;
//       case "doctor":
//         return Icons.medical_services;
//       case "patient":
//         return Icons.people;
//       default:
//         return Icons.circle; // fallback icon
//     }
//   }
// }

import 'package:flutter/material.dart';

class MenuItemModel {
  final String? title;
  final String? route;
  final String? permissionKey;
  final String? iconName;
  final List<String>? allowedRoles;

  MenuItemModel({
    required this.title,
    required this.route,
    required this.permissionKey,
    required this.iconName,
    required this.allowedRoles,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      title: json['title'],
      route: json['route'],
      permissionKey: json['permissionKey'],
      iconName: json['icon'],
      allowedRoles: List<String>.from(json['allowedRoles']),
    );
  }

  IconData get icon {
    switch (iconName) {
      case 'icon_dashboard':
        return Icons.dashboard;
      case 'icon_person':
        return Icons.person;
      case 'icon_calendar_today':
        return Icons.calendar_today;
      case 'icon_folder_shared':
        return Icons.folder_shared;
      case 'icon_settings':
        return Icons.settings;
      case 'icon_login':
        return Icons.login;
      default:
        return Icons.circle;
    }
  }
}
