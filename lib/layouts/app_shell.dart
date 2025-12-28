// import 'package:flutter/material.dart';

// import '../core/models/menu_item_model.dart';
// import '../core/responsive/device_type.dart';

// class AppShell extends StatelessWidget {
//   final String role; // patient / doctor / admin
//   final List<MenuItemModel> menu;
//   final Widget child;

//   const AppShell({
//     super.key,
//     required this.role,
//     required this.menu,
//     required this.child,
//   });

//   bool isPermanentDrawer(DeviceType deviceType, String role) {
//     if (role == "patient") return false;
//     return deviceType == DeviceType.desktop;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final device = getDeviceType(context);
//     final permanentDrawer = isPermanentDrawer(device, role);

//     // PATIENT LOGIC
//     if (role == "patient") {
//       if (device == DeviceType.desktop) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Patient Portal"),
//             actions: menu
//                 .map(
//                   (m) => TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       m.title,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           body: child,
//         );
//       } else {
//         return Scaffold(
//           appBar: null,
//           drawer: Drawer(
//             child: ListView(
//               children: menu
//                   .map(
//                     (m) => ListTile(
//                       title: Text(m.title),
//                       onTap: () => Navigator.pushNamed(context, m.route),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//           body: child,
//         );
//       }
//     }

//     // ADMIN / DOCTOR LOGIC
//     return Scaffold(
//       appBar: permanentDrawer ? null : AppBar(title: Text("$role Portal")),
//       drawer: permanentDrawer
//           ? null
//           : Drawer(
//               child: ListView(
//                 children: menu
//                     .map(
//                       (m) => ListTile(
//                         title: Text(m.title),
//                         onTap: () => Navigator.pushNamed(context, m.route),
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//       body: Row(
//         children: [
//           if (permanentDrawer)
//             SizedBox(
//               width: 250,
//               child: Drawer(
//                 child: ListView(
//                   children: menu
//                       .map(
//                         (m) => ListTile(
//                           title: Text(m.title),
//                           onTap: () => Navigator.pushNamed(context, m.route),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//             ),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }
// }
