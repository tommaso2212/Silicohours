import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/project/project_name.dart';
import 'package:silicohours/presentation/adapters/task/task_name.dart';
import 'package:silicohours/presentation/adapters/timelog/timelog_hours_logged.dart';
import 'package:silicohours/presentation/adapters/user/user_name.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

class TimeLogCard extends ConsumerWidget {
  const TimeLogCard({required this.timeLog, this.actionMenu, super.key});

  final TimeLog timeLog;
  final Widget? actionMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectByIdProvider(timeLog.projectId));
    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 6, color: ColorHelper.fromHex(project.value?.colorHex) ?? Colors.transparent),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  spacing: AppSpacing.sm,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSpacing.sm,
                        children: [
                          Row(
                            spacing: AppSpacing.sm,
                            children: [
                              TimelogHoursLogged(timeLog: timeLog),
                              TaskName(projectId: timeLog.projectId, taskId: timeLog.taskId),
                            ],
                          ),
                          if (project.hasValue) Text(project.value?.name ?? '-'),
                          if (timeLog.description != null) ...[
                            Text(
                              timeLog.description!,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceMuted),
                            ),
                          ],
                        ],
                      ),
                    ),
                    UserName(userId: timeLog.userId, showRole: false),
                    ?actionMenu,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
