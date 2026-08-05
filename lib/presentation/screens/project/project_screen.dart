import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project/components/create_project_dialog.dart';
import 'package:silicohours/presentation/screens/project/controller/project_section_controller.dart';
import 'package:silicohours/presentation/screens/project/sections/projects_section.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class ProjectScreen extends HookConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isAdmin = ref.watch(authServiceProvider).value?.isAdmin ?? false;
    return AppScreen(
      scrollController: scrollController,
      actions: [
        if (isAdmin)
          ElevatedButton.icon(
            onPressed: ref
                .read(createProjectUsecaseProvider)
                .usecaseDialog(ref, dialog: const CreateProjectDialog()),
            icon: const Icon(Icons.add),
            label: const Text('New project'),
          ),
      ],
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            title: 'Projects',
            description: 'Manage projects and their hourly rates.',
            actions: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Search projects', prefixIcon: Icon(Icons.search)),
                  onChanged: ref.read(fetchProjectsFilterProvider.notifier).set,
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: ProjectsSection(scrollController: scrollController),
        ),
      ],
    );
  }
}
