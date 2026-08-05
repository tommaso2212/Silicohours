import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/presentation.dart';

class TimelogDate extends StatelessWidget {
  const TimelogDate({required this.timeLog, super.key});

  final TimeLog timeLog;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;
    return Row(
      spacing: AppSpacing.xs,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.calendar_month_outlined, color: style?.color, size: style?.fontSize),
        Text(timeLog.formatDate, style: style),
      ],
    );
  }
}
