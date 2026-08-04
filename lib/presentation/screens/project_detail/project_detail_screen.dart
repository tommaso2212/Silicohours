import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project_detail/components/add_member_dialog.dart';
import 'package:silicohours/presentation/screens/project_detail/components/create_task_dialog.dart';
import 'package:silicohours/presentation/screens/project_detail/controller/project_detail_controller.dart';
import 'package:silicohours/presentation/screens/project_detail/sections/members_section.dart';
import 'package:silicohours/presentation/screens/project_detail/sections/tasks_section.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class ProjectDetailScreen extends HookConsumerWidget {
  const ProjectDetailScreen({required this.projectId, super.key});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authServiceProvider).value;
    final canManage = currentUser?.canManageMemberships ?? false;

    final projectAsync = ref.watch(fetchProjectProvider(projectId));
    final scrollController = useScrollController();

    return AppScreen(
      scrollController: scrollController,
      actions: [
        ElevatedButton.icon(
          onPressed: ref
              .read(createTaskUsecaseProvider)
              .usecaseDialog(ref, dialog: CreateTaskDialog(projectId: projectId)),
          icon: const Icon(Icons.add),
          label: const Text('New task'),
        ),
        if (canManage)
          ElevatedButton.icon(
            onPressed: ref
                .read(addProjectMemberUsecaseProvider)
                .usecaseDialog(ref, dialog: AddMemberDialog(projectId: projectId)),
            icon: const Icon(Icons.person_add_alt),
            label: const Text('Add member'),
          ),
      ],
      slivers: [
        SliverToBoxAdapter(
          child: projectAsync.when(
            loading: () => const PageHeader(title: ''),
            error: (_, _) => const PageHeader(title: 'Project'),
            data: (project) =>
                PageHeader(title: project.name, description: '€${project.hourPrice.toStringAsFixed(2)}/h'),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.lg,
              children: [
                Expanded(
                  flex: 2,
                  child: MembersSection(projectId: projectId, scrollController: scrollController),
                ),
                Expanded(child: TasksSection(projectId: projectId)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
