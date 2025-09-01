import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class FlickerContainer extends StatefulWidget {
  final bool animated;
  final Duration? duration;
  final Duration? reverseDuration;
  final bool reverse;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Curve? animationCurve;
  final Curve? animationReverseCurve;
  final double lowerBound;
  final double upperBound;
  final bool alertSoundEnabled;
  // ช่วงห่างการส่งเสียงแต่ละครั้ง
  final Duration? alertSoundInterval;
  // ระยะเวลาส่งเสียงเดือนจนหยุดส่งเสียง
  final Duration? alertSoundDuration;
  final String? alertSoundFilePath;
  final Widget? child;
  const FlickerContainer({
    super.key,
    this.animated = true,
    this.duration,
    this.reverseDuration,
    this.reverse = true,
    this.color,
    this.borderRadius,
    this.border,
    this.shadow,
    this.alignment,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.animationCurve,
    this.animationReverseCurve,
    this.lowerBound = 0.0,
    this.upperBound = 1.0,
    this.alertSoundEnabled = false,
    this.alertSoundInterval,
    this.alertSoundDuration,
    this.alertSoundFilePath,
    this.child,
  });

  @override
  State<FlickerContainer> createState() => _FlickerContainerState();
}

class _FlickerContainerState extends State<FlickerContainer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final _audioSound = AudioPlayer();
  Timer? _soundTimer;
  Timer? _soundDurationTimer;
  bool _isAnimated = false;
  bool _soundPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioSound.setReleaseMode(ReleaseMode.stop);
    _controller = AnimationController(
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: widget.upperBound,
      duration: widget.duration ?? const Duration(milliseconds: 800),
      reverseDuration: widget.reverseDuration,
      animationBehavior: AnimationBehavior.preserve,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve ?? Curves.fastEaseInToSlowEaseOut,
      reverseCurve: widget.animationReverseCurve,
    )..addListener(() {
        if (mounted) setState(() {});
      });

    if (widget.animated) _startAnimation();
    if (widget.alertSoundEnabled) _startAlertSound();
  }

  void _startAnimation() {
    if (_isAnimated) return;
    _controller.repeat(reverse: widget.reverse);
    _isAnimated = true;
  }

  void _stopAnimaion() {
    if (!_isAnimated) return;
    _controller.stop();
    _controller.reset();
    _controller.value = widget.upperBound;
    _isAnimated = false;
  }

  void _startAlertSound() {
    if (_soundPlaying) return;
    debugPrint('_startAlertSound');
    final interval = widget.alertSoundInterval ?? const Duration(milliseconds: 1500);
    _soundTimer = Timer.periodic(interval, (timer) => _playAlertSound());
    _soundPlaying = true;
    final duration = widget.alertSoundDuration;
    if (duration != null) {
      _soundDurationTimer = Timer.periodic(duration, (timer) => _stopAlertSound());
    }
  }

  void _stopAlertSound() {
    _soundTimer?.cancel();
    _soundDurationTimer?.cancel();
    _soundTimer = null;
    _soundDurationTimer = null;
    _audioSound.stop();
  }

  Future<void> _playAlertSound() async {
    // debugPrint('alertSoundFilePath : ${widget.alertSoundFilePath}');
    if (widget.alertSoundFilePath == null) return;
    try {
      await _audioSound.play(AssetSource(widget.alertSoundFilePath!.replaceFirst('assets/', '')));
    } catch (_) {}
  }

  @override
  void didUpdateWidget(covariant FlickerContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animated != oldWidget.animated) {
      if (widget.animated) {
        _startAnimation();
      } else {
        _stopAnimaion();
      }
    }
    if (widget.alertSoundDuration != oldWidget.alertSoundDuration ||
        widget.alertSoundInterval != oldWidget.alertSoundInterval ||
        widget.alertSoundFilePath != oldWidget.alertSoundFilePath) {
      _stopAlertSound();
      if (widget.alertSoundEnabled) _startAlertSound();
    }
    if (widget.alertSoundEnabled != oldWidget.alertSoundEnabled) {
      if (widget.alertSoundEnabled) {
        _startAlertSound();
      } else {
        _stopAlertSound();
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(() {
      if (_controller.isAnimating) _controller.stop();
    });
    _controller.dispose();
    _soundTimer?.cancel();
    _soundDurationTimer?.cancel();
    _soundTimer = null;
    _soundDurationTimer = null;
    _audioSound.stop();
    _audioSound.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        alignment: widget.alignment,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          border: widget.border,
          boxShadow: widget.shadow,
        ),
        child: widget.child,
      ),
    );
  }
}
