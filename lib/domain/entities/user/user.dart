import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silicohours/domain/entities/project_membership/project_membership.dart';

part 'user.freezed.dart';

enum Role { admin, user }

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? firstName,
    String? lastName,
    String? mail,
    @Default(Role.user) Role role,
  }) = _User;
}

extension UserExtension on User {
  bool get isAdmin => role == Role.admin;

  /// Admins see and manage every project; everyone else is scoped to their memberships.
  bool get canManageAllProjects => isAdmin;

  /// Only admins can add or remove members from a project.
  bool get canManageMemberships => isAdmin;

  /// Admins see time logs for every user; everyone else only sees their own.
  bool get canViewAllTimeLogs => isAdmin;

  bool canAccessProject(String projectId, List<ProjectMembership> memberships) =>
      canManageAllProjects || memberships.any((m) => m.userId == id && m.projectId == projectId);

  String get fullName => [firstName, lastName].where((element) => element != null).join(' ');

  String get initials {
    final first = firstName?.isNotEmpty == true ? firstName![0] : '';
    final last = lastName?.isNotEmpty == true ? lastName![0] : '';
    return '$first$last'.toUpperCase();
  }
}
