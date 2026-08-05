import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_membership.freezed.dart';

@freezed
abstract class ProjectMembership with _$ProjectMembership {
  const factory ProjectMembership({
    required String id,
    required String projectId,
    required String userId,
  }) = _ProjectMembership;
}

extension ProjectMembershipListExtension on List<ProjectMembership> {
  List<String> get projectIds => map((m) => m.projectId).toSet().toList();

  List<String> get userIds => map((m) => m.userId).toSet().toList();

  bool hasProject(String projectId) => any((m) => m.projectId == projectId);

  bool hasUser(String userId) => any((m) => m.userId == userId);
}
