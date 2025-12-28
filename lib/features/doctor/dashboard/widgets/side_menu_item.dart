import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;

  const SideMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isWeb = width >= 1024;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: isActive ? activeColor.withOpacity(0.1) : Colors.transparent,
        leading: Icon(
          icon,
          size: isWeb ? 24 : 20,
          color: isActive ? activeColor : inactiveColor,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: isWeb ? 16 : 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? activeColor : inactiveColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
