import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/adapters/project/project_name.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';

class ProjectDropdown extends ConsumerWidget {
  const ProjectDropdown({required this.controller, super.key});

  final DropdownController<Project> controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).value;
    return PaginationDropdown<Project>(
      label: 'Project',
      controller: controller,
      fetchItems: (page, pageSize, q) {
        if (user == null) return Future.value(<Project>[]);
        return GetAccessibleProjectsUsecase(
          projectRepository: ref.read(projectRepositoryProvider),
          projectMembershipRepository: ref.read(projectMembershipRepositoryProvider),
        ).execute((user: user, pageIndex: page, pageSize: pageSize, q: q)).map(
          onResult: (result) => result,
          onError: (_) => [],
        );
      },
      itemBuilder: (item) => ProjectName.project(project: item),
    );
  }
}
