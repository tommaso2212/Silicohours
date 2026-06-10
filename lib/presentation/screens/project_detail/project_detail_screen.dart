import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project_detail/components/create_task_dialog.dart';
import 'package:silicohours/presentation/screens/project_detail/controller/project_detail_controller.dart';
import 'package:silicohours/presentation/screens/project_detail/sections/tasks_section.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class ProjectDetailScreen extends HookConsumerWidget {
  const ProjectDetailScreen({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final projectAsync = ref.watch(fetchProjectProvider(projectId));

    return AppScreen(
      scrollController: scrollController,
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            final name = await ref
                .read(dialogServiceProvider.notifier)
                .showCustomDialog<String>(builder: (_) => const CreateTaskDialog());
            if (name != null) {
              ref.read(createTaskUsecaseProvider).execute((projectId: projectId, name: name));
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('New task'),
        ),
      ],
      slivers: [
        SliverToBoxAdapter(
          child: projectAsync.when(
            loading: () => const PageHeader(title: ''),
            error: (_, _) => const PageHeader(title: 'Project'),
            data: (project) => PageHeader(
              title: project.name,
              description: '€${project.hourPrice.toStringAsFixed(2)}/h',
              actions: [
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Search tasks', prefixIcon: Icon(Icons.search)),
                    onChanged: (value) => ref.read(fetchTasksFilterProvider(projectId).notifier).set(value),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: TasksSection(projectId: projectId, scrollController: scrollController),
        ),
      ],
    );
  }
}
