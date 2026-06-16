import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';

final _taskByIdProvider = FutureProvider.family<Task, ({String projectId, String taskId})>((ref, input) {
  return GetTaskUsecase(taskRepository: ref.read(taskRepositoryProvider))
      .execute((projectId: input.projectId, taskId: input.taskId))
      .map(onResult: (task) => task, onError: (error) => throw error);
});

class TaskName extends ConsumerWidget {
  const TaskName({required String this.projectId, required String this.taskId, this.iconRadius = 12, super.key})
    : task = null;
  const TaskName.task({required Task this.task, this.iconRadius = 12, super.key}) : projectId = null, taskId = null;

  final String? projectId;
  final String? taskId;
  final Task? task;

  final double iconRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskAsync = task != null
        ? AsyncData(task!)
        : ref.watch(_taskByIdProvider((projectId: projectId!, taskId: taskId!)));

    return taskAsync.when(
      loading: () => CircularProgressIndicator(
        strokeWidth: 2,
        constraints: BoxConstraints(
          minHeight: iconRadius,
          maxHeight: iconRadius,
          minWidth: iconRadius,
          maxWidth: iconRadius,
        ),
      ),
      error: (_, _) => const Text('-'),
      data: (task) => Text(task.name),
    );
  }
}
