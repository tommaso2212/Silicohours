import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/adapters/task/task_name.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project_detail/controller/project_detail_controller.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';

class TasksSection extends HookConsumerWidget {
  const TasksSection({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchProjectTasksProvider(projectId));

    return Container(
      constraints: const BoxConstraints(maxHeight: 320),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadius,
        border: Border.all(color: AppColors.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.md,
        children: [
          SectionHeader(
            title: 'Tasks',
            actions: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Search tasks', prefixIcon: Icon(Icons.search)),
                  onChanged: (value) => ref.read(fetchTasksFilterProvider(projectId).notifier).set(value),
                ),
              ),
            ],
          ),
          PaginationList(
            fetchItems: fetchItems,
            itemBuilder: (item) => TaskName.task(
              task: item,
              trailing: IconButton(
                tooltip: 'Delete task',
                onPressed: () => ref.read(deleteTaskUsecaseProvider).execute((id: item.id)),
                icon: const Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
