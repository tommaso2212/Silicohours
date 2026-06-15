import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';

final _projectByIdProvider = FutureProvider.family<Project, String>((ref, projectId) {
  return GetProjectUsecase(
    projectRepository: ref.read(projectRepositoryProvider),
  ).execute((id: projectId)).map(
        onResult: (project) => project,
        onError: (error) => throw error,
      );
});

class ProjectName extends ConsumerWidget {
  final String projectId;

  const ProjectName({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(_projectByIdProvider(projectId));

    return projectAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (project) => Text(project.name),
    );
  }
}
