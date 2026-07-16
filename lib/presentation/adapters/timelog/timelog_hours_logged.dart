import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class TimelogHoursLogged extends StatelessWidget {
  const TimelogHoursLogged({required this.timeLog, super.key});

  final TimeLog timeLog;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${timeLog.hoursLogged}', style: Theme.of(context).textTheme.titleMedium),
          TextSpan(
            text: ' h',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceMuted),
          ),
        ],
      ),
    );
  }
}
