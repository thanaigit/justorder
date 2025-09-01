import 'package:flutter/material.dart';

class RotatedIconAnimation extends StatefulWidget {
  final Widget icon;
  final bool animated;
  final Duration? duration;
  final Duration? reverseDuration;
  final bool reverse;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Curve? animationCurve;
  final Curve? animationReverseCurve;
  final double lowerBound;
  final double upperBound;
  final Widget? child;
  const RotatedIconAnimation({
    super.key,
    required this.icon,
    this.animated = true,
    this.duration,
    this.reverseDuration,
    this.reverse = true,
    this.color,
    this.borderRadius,
    this.border,
    this.alignment,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.animationCurve,
    this.animationReverseCurve,
    this.lowerBound = 0.0,
    this.upperBound = 0.5,
    this.child,
  });

  @override
  State<RotatedIconAnimation> createState() => _RotatedIconAnimationState();
}

class _RotatedIconAnimationState extends State<RotatedIconAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: widget.upperBound,
      duration: widget.duration ?? const Duration(milliseconds: 800),
      reverseDuration: widget.reverseDuration,
      animationBehavior: AnimationBehavior.normal,
    )..repeat(reverse: widget.reverse);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve ?? Curves.easeInOutCubicEmphasized,
      reverseCurve: widget.animationReverseCurve,
    )..addListener(() {
        if (mounted) setState(() {});
      });

    if (!widget.animated) _controller.stop();
  }

  @override
  void dispose() {
    _controller.removeListener(() {
      if (_controller.isAnimating) _controller.stop();
    });
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.icon,
    );
  }
}
