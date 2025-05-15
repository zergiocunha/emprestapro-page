import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double? slideOffset;
  final Duration? delay;
  final Duration? duration;

  const ScrollAnimatedWidget({
    super.key,
    required this.child,
    this.slideOffset,
    this.delay,
    this.duration,
  });

  @override
  State<ScrollAnimatedWidget> createState() => _ScrollAnimatedWidgetState();
}

class _ScrollAnimatedWidgetState extends State<ScrollAnimatedWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: widget.child
          .animate(
            target: isVisible ? 1 : 0,
          )
          .fadeIn(
            duration: widget.duration ?? 800.ms,
            delay: widget.delay ?? 0.ms,
          )
          .slideY(
            begin: widget.slideOffset ?? 0.2,
            duration: widget.duration ?? 800.ms,
            delay: widget.delay ?? 0.ms,
          ),
    );
  }
}
