import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project/controller/project_section_controller.dart';
import 'package:silicohours/presentation/screens/project/sections/projects_section.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class ProjectScreen extends HookConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return AppScreen(
      scrollController: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            title: 'Projects',
            description: 'Manage projects and their hourly rates.',
            actions: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Search projects', prefixIcon: Icon(Icons.search)),
                  onChanged: (value) => ref.read(fetchProjectsFilterProvider.notifier).set(value),
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
