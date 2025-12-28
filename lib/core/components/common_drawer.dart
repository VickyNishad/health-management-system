import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/menu_item_model.dart';

class CommonDrawer extends StatelessWidget {
  final List<MenuItemModel> menuItems;
  final bool isPermanent;

  const CommonDrawer({
    super.key,
    required this.menuItems,
    this.isPermanent = false,
  });

  @override
  Widget build(BuildContext context) {
    final drawerContent = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(child: Text('Menu')),
          Expanded(
            child: ListView(
              children: menuItems.map((m) {
                return ListTile(
                  leading: Icon(m.icon),
                  title: Text(m.title ?? ''),
                  onTap: () {
                    print('----------------');
                    if (!isPermanent) Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed(m.route);
                    context.go(m.route ?? '');
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );

    return isPermanent
        ? Container(color: Colors.white, child: drawerContent)
        : Drawer(child: drawerContent);
  }
}
