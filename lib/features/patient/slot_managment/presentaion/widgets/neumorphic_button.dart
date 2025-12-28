import 'package:flutter/material.dart';

class NeumorphicButton extends StatefulWidget {
  const NeumorphicButton({super.key});

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  // Initial state: Raised (unpressed)
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    // A small delay makes the press feel more responsive and deliberate
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isPressed = false;
      });
    });
    // Add your button logic here (e.g., print('Button tapped!'));
  }

  @override
  Widget build(BuildContext context) {
    // Listeners for press events
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Smooth transition
        curve: Curves.easeOut,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Must match background for effect
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: _isPressed
              ? [
                  // *** PRESSED (CONCAVE) STATE ***
                  // Invert shadows to look like it's sunken
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(-4, -4),
                    blurRadius: 7.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(4, 4),
                    blurRadius: 7.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : [
                  // *** RAISED (DEFAULT) STATE ***
                  // Your original "pop-out" shadows
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(6, 6),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(-6, -6),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
        child: const Center(
          child: Text(
            'Press Me!',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
