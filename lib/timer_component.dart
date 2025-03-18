// lib/timer_component.dart
import 'package:flutter/material.dart';
import 'dart:async';

class TimerComponent extends StatefulWidget {
  @override
  _TimerComponentState createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  int secondsPassed = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secondsPassed++;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time used: ${formatDuration(Duration(seconds: secondsPassed))}',
      style: TextStyle(fontSize: 16),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}