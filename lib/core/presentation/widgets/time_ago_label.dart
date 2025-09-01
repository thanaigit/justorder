import 'dart:async';

import 'package:flutter/material.dart';

enum TimeAgoPreferDisplay {
  onlyMaxPeriod,
  possibleMax,
  possibleMinute,
  possibleHour,
  maxTwoPeriod,
}

class TimeAgoLabel extends StatefulWidget {
  final DateTime startTime;
  final DateTime? endTime;
  final TextStyle? style;
  final Duration? duration;
  final bool autoDuration;
  final String? prefixText;
  final String? subfixText;
  final String? agoText;
  final TextStyle? prefixStyle;
  final TextStyle? subfixStyle;
  final TimeAgoPreferDisplay displayType;
  const TimeAgoLabel({
    super.key,
    required this.startTime,
    this.endTime,
    this.style,
    this.duration,
    this.autoDuration = false,
    this.prefixText,
    this.subfixText,
    this.agoText,
    this.prefixStyle,
    this.subfixStyle,
    this.displayType = TimeAgoPreferDisplay.onlyMaxPeriod,
  });

  @override
  State<TimeAgoLabel> createState() => _TimeAgoLabelState();
}

class _TimeAgoLabelState extends State<TimeAgoLabel> {
  Timer? _timer;
  Duration? _duration;

  void _setDuration() {
    if (_duration == null) {
      _duration = const Duration(seconds: 5);
      return;
    }
    final pass = DateTime.now().difference(widget.startTime);
    if (widget.autoDuration) {
      if (widget.displayType == TimeAgoPreferDisplay.possibleMax) {
        _duration = const Duration(seconds: 1);
      } else if (pass.inMinutes > 0 && pass.inHours == 0) {
        _duration = const Duration(minutes: 1);
        if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod) {
          _duration = const Duration(seconds: 1);
        }
      } else if (pass.inHours > 0 && pass.inDays == 0) {
        _duration = const Duration(hours: 1);
        if (widget.displayType == TimeAgoPreferDisplay.possibleMinute ||
            widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod) {
          _duration = const Duration(minutes: 1);
        }
      } else if (pass.inDays > 0) {
        _duration = const Duration(days: 1);
        if (widget.displayType == TimeAgoPreferDisplay.possibleHour ||
            widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod) {
          _duration = const Duration(hours: 1);
        } else if (widget.displayType == TimeAgoPreferDisplay.possibleMinute) {
          _duration = const Duration(minutes: 5);
        }
      }
    }
  }

  void _setTimer() {
    if (_timer != null) _timer!.cancel();
    _timer = Timer(
      _duration!,
      () {
        if (!mounted) return;
        setState(() {
          if (_timer != null) _timer!.cancel();
          _setDuration();
          _setTimer();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _duration = widget.duration;
    if (widget.autoDuration) _duration = const Duration(seconds: 5);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.endTime == null) _setTimer();
    final sAgo = widget.agoText ?? 'ที่ผ่านมา';
    final timePass = (widget.endTime == null)
        ? DateTime.now().difference(widget.startTime)
        : widget.endTime!.difference(widget.startTime);
    String timeAgo = '';
    var secs = timePass.inSeconds;
    var mins = timePass.inMinutes;
    var hrs = timePass.inHours;
    var days = timePass.inDays;
    String sHrs = '', sMins = '', sSecs = '';

    if (mins == 0) {
      final sec = secs;
      timeAgo = sec < 10 ? 'ตอนนี้' : '$secs วินาที$sAgo';
    } else if (hrs == 0) {
      timeAgo = '$mins นาที$sAgo';
      if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod ||
          widget.displayType == TimeAgoPreferDisplay.possibleMax) {
        secs = secs - (60 * mins);
        sSecs = (secs > 0) ? '$secs วินาที' : '';
        timeAgo = '$mins นาที $sSecs $sAgo';
      }
    } else if (days == 0) {
      timeAgo = '$hrs ชั่วโมง$sAgo';
      if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod ||
          widget.displayType == TimeAgoPreferDisplay.possibleMinute) {
        mins = mins - (60 * hrs);
        sMins = (mins > 0) ? '$mins นาที' : '';
        timeAgo = '$hrs ชม. $sMins $sAgo';
      } else if (widget.displayType == TimeAgoPreferDisplay.possibleMax) {
        secs = secs - (60 * mins);
        mins = mins - (60 * hrs);
        sSecs = (secs > 0) ? '$secs วินาที' : '';
        sMins = (mins > 0) ? '$mins นาที' : '';
        timeAgo = '$hrs ชม. $sMins $sSecs $sAgo';
      }
    } else if (days > 0 && days <= 30) {
      timeAgo = '$days วัน$sAgo';
      if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod ||
          widget.displayType == TimeAgoPreferDisplay.possibleHour) {
        hrs = hrs - (24 * days);
        sHrs = (hrs > 0) ? '$hrs ชม.' : '';
        timeAgo = '$days วัน $sHrs $sAgo';
      } else if (widget.displayType == TimeAgoPreferDisplay.possibleMinute) {
        mins = mins - (60 * hrs);
        hrs = hrs - (24 * days);
        sHrs = (hrs > 0) ? '$hrs ชม.' : '';
        sMins = (mins > 0) ? '$mins นาที' : '';
        timeAgo = '$days วัน $sHrs $sMins $sAgo';
      } else if (widget.displayType == TimeAgoPreferDisplay.possibleMax) {
        secs = secs - (60 * mins);
        mins = mins - (60 * hrs);
        hrs = hrs - (24 * days);
        sHrs = (hrs > 0) ? '$hrs ชม.' : '';
        sMins = (mins > 0) ? '$mins นาที' : '';
        sSecs = (secs > 0) ? '$secs วินาที' : '';
        timeAgo = '$days วัน $sHrs $sMins $sSecs $sAgo';
      }
    } else if (days > 30 && days <= 365) {
      final m = days ~/ 30;
      timeAgo = (m >= 12) ? '1 ปี$sAgo' : '$m เดือน $sAgo';
      if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod) {
        final d = days - (m * 30);
        timeAgo = (d > 0 && m < 12)
            ? '$m เดือน $d วัน$sAgo'
            : (m >= 12)
                ? '1 ปี$sAgo'
                : '$m เดือน $sAgo';
      }
    } else if (days > 365) {
      final y = days ~/ 365;
      timeAgo = '$y ปี$sAgo';
      if (widget.displayType == TimeAgoPreferDisplay.maxTwoPeriod) {
        final d = days - (y * 365);
        final m = d ~/ 30;
        timeAgo = (d < 30) ? '$y ปี $d วัน$sAgo' : '$y ปี $m เดือน$sAgo';
      }
    }
    final addTextEmpty = ((widget.prefixText == null ||
            (widget.prefixText != null && widget.prefixText!.isEmpty)) &&
        (widget.subfixText == null || (widget.subfixText != null && widget.subfixText!.isEmpty)));
    return addTextEmpty
        ? Text(timeAgo.trim(), style: widget.style)
        : Text.rich(
            TextSpan(text: widget.prefixText, style: widget.prefixStyle ?? widget.style, children: [
            TextSpan(text: timeAgo.trim(), style: widget.style),
            TextSpan(text: widget.subfixText, style: widget.subfixStyle ?? widget.style)
          ]));
  }
}
