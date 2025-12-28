import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double visibleFraction;
  final Offset slideOffset;

  const FadeOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 900), // slower
    this.visibleFraction = 0.05, // trigger earlier
    this.slideOffset = const Offset(0, 0.12),
  });

  @override
  State<FadeOnScroll> createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > widget.visibleFraction && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : widget.slideOffset,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: widget.child,
        ),
      ),
    );
  }
}
