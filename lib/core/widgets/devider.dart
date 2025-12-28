import 'package:flutter/material.dart';

class MyDevider extends StatelessWidget {
  const MyDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.grey[400])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("OR"),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.grey[400])),
      ],
    );
  }
}
