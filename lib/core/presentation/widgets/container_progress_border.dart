import 'package:flutter/material.dart';
import 'package:progress_border/progress_border.dart';

class ContainerProgressBorder extends StatefulWidget {
  final Duration? duration;
  final EdgeInsetsGeometry? padding;
  final BoxShape shape;
  final Color backgroundColor;
  final Color progressColor;
  final Color? progressBackgroundColor;
  final double progressWidth;
  final double strokeAlign;
  final BorderStyle borderStyle;
  final Border? border;
  final bool clockwise;
  final Widget? child;
  const ContainerProgressBorder({
    super.key,
    this.duration,
    this.padding,
    this.shape = BoxShape.circle,
    this.backgroundColor = Colors.white,
    this.progressColor = Colors.blue,
    this.progressBackgroundColor,
    this.progressWidth = 3.0,
    this.strokeAlign = BorderSide.strokeAlignInside,
    this.borderStyle = BorderStyle.solid,
    this.border,
    this.clockwise = true,
    this.child,
  });

  @override
  State<ContainerProgressBorder> createState() => _ContainerProgressBorderState();
}

class _ContainerProgressBorderState extends State<ContainerProgressBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: widget.duration ?? const Duration(seconds: 10),
      animationBehavior: AnimationBehavior.preserve,
    )..addListener(() {
        if (mounted) setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.removeListener(() => _controller.stop());
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        shape: widget.shape,
        color: widget.backgroundColor,
        border: ProgressBorder.all(
          width: widget.progressWidth,
          color: widget.progressColor,
          strokeAlign: widget.strokeAlign,
          backgroundColor: widget.progressBackgroundColor ?? widget.backgroundColor,
          backgroundBorder: widget.border,
          style: widget.borderStyle,
          clockwise: widget.clockwise,
          progress: _controller.value,
        ),
      ),
      child: widget.child,
    );
  }
}
