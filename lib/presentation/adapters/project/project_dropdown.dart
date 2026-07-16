import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/adapters/project/project_name.dart';
import 'package:silicohours/presentation/components/components.dart';

class ProjectDropdown extends ConsumerWidget {
  const ProjectDropdown({required this.controller, super.key});

  final DropdownController<Project> controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationDropdown<Project>(
      label: 'Project',
      controller: controller,
      fetchItems: (page, pageSize, q) => GetAllProjectsUsecase(
        projectRepository: ref.read(projectRepositoryProvider),
      ).execute((pageIndex: page, pageSize: pageSize, q: q)).map(onResult: (result) => result, onError: (_) => []),
      itemBuilder: (item) => ProjectName.project(project: item),
    );
  }
}
