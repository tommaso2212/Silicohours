import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class TimeLogCard extends StatelessWidget {
  const TimeLogCard({required this.timeLog, this.actionMenu, super.key});

  final TimeLog timeLog;
  final Widget? actionMenu;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${timeLog.hoursLogged}h — ${timeLog.projectId} / ${timeLog.taskId}',
                    style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                  ),
                  if (timeLog.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      timeLog.description!,
                      style: const TextStyle(color: AppColors.onSurfaceMuted, fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
            ?actionMenu,
          ],
        ),
      ),
    );
  }
}
