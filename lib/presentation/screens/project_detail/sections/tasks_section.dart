import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project_detail/components/task_card.dart';
import 'package:silicohours/presentation/screens/project_detail/controller/project_detail_controller.dart';

class TasksSection extends ConsumerWidget {
  const TasksSection({required this.projectId, required this.scrollController, super.key});

  final String projectId;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchProjectTasksProvider(projectId));

    return PaginationList.sliver(
      scrollController: scrollController,
      fetchItems: fetchItems,
      itemBuilder: (task) => TaskCard(
        task: task,
        actionMenu: IconButton(
          onPressed: () => ref.read(deleteTaskUsecaseProvider).execute((id: task.id)),
          icon: const Icon(Icons.delete_outline_outlined),
        ),
      ),
    );
  }
}
