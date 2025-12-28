import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final Function()? onTap;
  final bool isLoading; // New parameter to control the loader

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
    this.isLoading = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Disable the onTap handler if loading to prevent multiple presses
      onTap: isLoading ? null : onTap,

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
          // Optionally dim the button when loading
          // color: isLoading ? Colors.black54 : Colors.black,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize
                .min, // Important: makes the Row only take up the necessary width
            children: [
              // 1. Conditional Loader (Left Side)
              if (isLoading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2, // Make the loader thinner
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),

              // 2. Spacer between Loader and Text
              if (isLoading) const SizedBox(width: 10),

              // 3. Button Title
              Text(
                buttonTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
