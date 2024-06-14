import 'package:flutter/material.dart';
import 'package:chindi_ke/models/formatted_time.dart';

class TimeDisplay extends StatelessWidget {
  final int time;
  const TimeDisplay({super.key, required this.time});

  FormattedTime _formatTime(int time) {
    return FormattedTime(hours: time ~/ 60, minutes: time % 60);
  }

  @override
  Widget build(BuildContext context) {
    FormattedTime formattedTime = _formatTime(time);
    String hours = formattedTime.hours.toString().padLeft(2, '0');
    String minutes = formattedTime.minutes.toString().padRight(2, '0');

    return Text(
      '$hours:$minutes',
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
