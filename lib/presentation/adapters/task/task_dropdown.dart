import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/adapters/task/task_name.dart';
import 'package:silicohours/presentation/components/components.dart';

class TaskDropdown extends ConsumerWidget {
  const TaskDropdown({required this.projectId, required this.controller, super.key});

  final String? projectId;
  final DropdownController<Task> controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationDropdown<Task>(
      label: 'Task',
      enabled: projectId != null,
      controller: controller,
      fetchItems: (page, pageSize, q) => GetProjectTasksUsecase(taskRepository: ref.read(taskRepositoryProvider))
          .execute((projectId: projectId!, pageIndex: page, pageSize: pageSize, q: q))
          .map(onResult: (result) => result, onError: (_) => []),
      itemBuilder: (item) => TaskName.task(task: item),
    );
  }
}
