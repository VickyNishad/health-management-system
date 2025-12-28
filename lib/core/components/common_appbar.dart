import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/menu_item_model.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<MenuItemModel>? actionsMenu;
  final bool showMenuInAppBar;

  const CommonAppBar({
    super.key,
    this.title = '',
    this.actionsMenu,
    this.showMenuInAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: showMenuInAppBar && actionsMenu != null
          ? actionsMenu!.map((m) {
              return TextButton.icon(
                onPressed: () => context.go(m.route ?? ''),
                icon: Icon(m.icon, color: Colors.black),
                label: Text(
                  m.title ?? '',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList()
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
