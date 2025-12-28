import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imagePath; // supports asset, network, file
  final double size; // responsive size
  final bool isCircle; // circle or rounded rectangle
  final double borderRadius; // used when circle = false

  const ProfileImage({
    super.key,
    this.imagePath,
    this.size = 80,
    this.isCircle = true,
    this.borderRadius = 12,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith("http://") || path.startsWith("https://");
  }

  bool _isLocalFile(String path) {
    return path.startsWith("/") || path.startsWith("file://");
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imagePath == null || imagePath!.isEmpty) {
      // Placeholder
      imageWidget = Icon(Icons.person, size: size * 0.6, color: Colors.grey);
    } else if (_isNetworkImage(imagePath!)) {
      imageWidget = Image.network(
        imagePath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    } else if (_isLocalFile(imagePath!)) {
      final file = File(imagePath!);
      imageWidget = file.existsSync()
          ? Image.file(file, width: size, height: size, fit: BoxFit.cover)
          : Icon(Icons.person, size: size * 0.6, color: Colors.grey);
    } else {
      // ASSET IMAGE
      imageWidget = Image.asset(
        imagePath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    }

    return ClipRRect(
      borderRadius: isCircle
          ? BorderRadius.circular(size)
          : BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: size,
        height: size,
        // color: Colors.white,
        child: imageWidget,
      ),
    );
  }
}
