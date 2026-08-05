import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/project/project_name.dart';
import 'package:silicohours/presentation/adapters/task/task_name.dart';
import 'package:silicohours/presentation/adapters/timelog/timelog_date.dart';
import 'package:silicohours/presentation/adapters/timelog/timelog_hours_logged.dart';
import 'package:silicohours/presentation/adapters/user/user_name.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/time_log/components/edit_time_log_dialog.dart';
import 'package:silicohours/presentation/screens/time_log/components/time_log_card.dart';
import 'package:silicohours/presentation/screens/time_log/controller/time_log_controller.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class TimeLogsSection extends ConsumerWidget {
  const TimeLogsSection({required this.scrollController, super.key});

  final ScrollController scrollController;

  static const _columns = ['Date', 'Project', 'Task', 'User', 'Hours', 'Description', ''];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchTimeLogsProvider);

    return context.onMobile(
      onMobile: () => PaginationList<TimeLog>.sliver(
        scrollController: scrollController,
        fetchItems: fetchItems,
        itemBuilder: (item) => TimeLogCard(
          timeLog: item,
          actionMenu: _TimeLogActionMenu(timeLog: item),
        ),
      ),
      orElse: () => SliverToBoxAdapter(
        child: Card(
          child: PaginationDataTable<TimeLog>(
            scrollController: scrollController,
            fetchItems: fetchItems,
            columnsNumber: _columns.length,
            headerBuilder: (index) => Text(_columns[index]),
            cellBuilder: (index, timeLog) => switch (index) {
              0 => TimelogDate(timeLog: timeLog),
              1 => ProjectName(projectId: timeLog.projectId),
              2 => TaskName(projectId: timeLog.projectId, taskId: timeLog.taskId),
              3 => UserName(userId: timeLog.userId, showRole: false),
              4 => TimelogHoursLogged(timeLog: timeLog),
              5 => Text(
                timeLog.description ?? '—',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceMuted),
              ),
              6 => Align(
                alignment: Alignment.centerRight,
                child: _TimeLogActionMenu(timeLog: timeLog),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}

class _TimeLogActionMenu extends ConsumerWidget {
  const _TimeLogActionMenu({required this.timeLog});

  final TimeLog timeLog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionMenu(
      actions: [
        MenuAction.edit(
          action: ref.read(editTimeLogUsecaseProvider).usecaseDialog(ref, dialog: EditTimeLogDialog(timeLog: timeLog)),
        ),
        MenuAction.delete(action: () => ref.read(deleteTimeLogUsecaseProvider).execute((id: timeLog.id))),
      ],
    );
  }
}
