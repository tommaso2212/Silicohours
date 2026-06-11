import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/time_log/components/edit_time_log_dialog.dart';
import 'package:silicohours/presentation/screens/time_log/components/time_log_card.dart';
import 'package:silicohours/presentation/screens/time_log/controller/time_log_controller.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';

class TimeLogsSection extends ConsumerWidget {
  const TimeLogsSection({required this.scrollController, super.key});

  final ScrollController scrollController;

  static const _columns = ['Project', 'Task', 'User', 'Hours', 'Description', ''];

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
              0 => Text(timeLog.projectId),
              1 => Text(timeLog.taskId),
              2 => Text(timeLog.userId),
              3 => Text('${timeLog.hoursLogged}h'),
              4 => Text(timeLog.description ?? '—'),
              5 => Align(
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
        MenuAction(
          label: 'Edit',
          icon: const Icon(Icons.edit_outlined),
          action: () async {
            final input = await showDialog<EditTimeLogInput>(
              context: context,
              builder: (_) => EditTimeLogDialog(timeLog: timeLog),
            );
            if (input != null) await ref.read(editTimeLogUsecaseProvider).execute(input);
          },
        ),
        MenuAction(
          label: 'Delete',
          icon: const Icon(Icons.delete_outline),
          action: () => ref.read(deleteTimeLogUsecaseProvider).execute((id: timeLog.id)),
        ),
      ],
    );
  }
}
