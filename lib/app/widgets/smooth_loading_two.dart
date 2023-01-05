import 'package:flutter/material.dart';

/// [SmoothLoadingWidgetTwo] is a widget shows content after loaing in a animated way.
///
/// [child] is the content.
///
class SmoothLoadingWidgetTwo extends StatefulWidget {
  const SmoothLoadingWidgetTwo({
    Key? key,
    required this.onAnimationCompleted,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.animCurve = Curves.easeIn,
  }) : super(key: key);

  final VoidCallback? onAnimationCompleted;
  final Widget? child;
  final Duration? duration;
  final Curve? animCurve;

  @override
  State<SmoothLoadingWidgetTwo> createState() => _SmoothLoadingState();
}

class _SmoothLoadingState extends State<SmoothLoadingWidgetTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: widget.animCurve!));

    _animationController.forward();
    _animation.addStatusListener(defaultAnimationsStatusListener);
  }

  void defaultAnimationsStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) widget.onAnimationCompleted!();
  }

  @override
  void dispose() {
    _animation.removeStatusListener(defaultAnimationsStatusListener);
    _animationController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _animation as Animation<double>,
        child: widget.child,
      );
}
