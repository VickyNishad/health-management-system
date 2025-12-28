// Separate StatefulWidget to handle individual hover states
import 'package:flutter/material.dart';

class HoverNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const HoverNavItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<HoverNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool showUnderline = _isHovered || widget.isActive;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: showUnderline ? Colors.blue : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: showUnderline ? 1 : 0,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
