import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/time_log/controller/time_log_controller.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

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
        itemBuilder: (item) => _TimeLogCard(
          timeLog: item,
          onDelete: () => ref.read(deleteTimeLogUsecaseProvider).execute((id: item.id)),
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
                child: IconButton(
                  icon: const Icon(Icons.delete_outline_outlined),
                  onPressed: () => ref.read(deleteTimeLogUsecaseProvider).execute((id: timeLog.id)),
                ),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}

class _TimeLogCard extends StatelessWidget {
  const _TimeLogCard({required this.timeLog, required this.onDelete});

  final TimeLog timeLog;
  final VoidCallback onDelete;

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
                      style: TextStyle(color: AppColors.onSurfaceMuted, fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_outlined),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
