import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

final projectByIdProvider = FutureProvider.family<Project, String>((ref, projectId) {
  return GetProjectUsecase(
    projectRepository: ref.read(projectRepositoryProvider),
  ).execute((id: projectId)).map(onResult: (project) => project, onError: (error) => throw error);
});

class ProjectName extends ConsumerWidget {
  const ProjectName({required String this.projectId, this.iconRadius = 12, super.key}) : project = null;
  const ProjectName.project({required Project this.project, this.iconRadius = 12, super.key}) : projectId = null;

  final String? projectId;
  final Project? project;

  final double iconRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = project != null ? AsyncData(project!) : ref.watch(projectByIdProvider(projectId!));

    return projectAsync.when(
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
      data: (project) => Row(
        spacing: AppSpacing.sm,
        children: [
          if (project.colorHex != null)
            CircleAvatar(
              radius: iconRadius,
              backgroundColor: ColorHelper.fromHex(project.colorHex) ?? Colors.transparent,
            ),
          Text(project.name),
        ],
      ),
    );
  }
}
