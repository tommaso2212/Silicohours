import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/project/components/edit_project_dialog.dart';
import 'package:silicohours/presentation/screens/project/components/project_card.dart';
import 'package:silicohours/presentation/screens/project/controller/project_section_controller.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({required this.scrollController, super.key});

  final ScrollController scrollController;

  static const _columns = ['Name', 'Hourly Rate', ''];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchProjectsProvider);

    return context.onMobile(
      onMobile: () => PaginationList.sliver(
        scrollController: scrollController,
        fetchItems: fetchItems,
        itemBuilder: (item) => ProjectCard(
          project: item,
          actionMenu: _ProjectActionMenu(project: item),
        ),
      ),
      orElse: () => SliverToBoxAdapter(
        child: Card(
          child: PaginationDataTable(
            scrollController: scrollController,
            fetchItems: fetchItems,
            columnsNumber: _columns.length,
            headerBuilder: (index) => Text(_columns[index]),
            cellBuilder: (index, project) => switch (index) {
              0 => Text(project.name),
              1 => Text('€${project.hourPrice.toStringAsFixed(2)}/h'),
              2 => Align(
                alignment: Alignment.centerRight,
                child: _ProjectActionMenu(project: project),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}

class _ProjectActionMenu extends ConsumerWidget {
  const _ProjectActionMenu({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionMenu(
      actions: [
        MenuAction(
          label: 'Edit',
          icon: const Icon(Icons.edit),
          action: () => showDialog<void>(
            context: context,
            builder: (_) => EditProjectDialog(project: project),
          ),
        ),
        MenuAction(
          label: 'Delete',
          action: () => ref.read(deleteProjectUsecaseProvider).execute((id: project.id)),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
