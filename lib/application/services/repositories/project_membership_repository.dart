import 'package:silicohours/domain/domain.dart';

abstract class ProjectMembershipRepository {
  Future<List<ProjectMembership>> getProjectMemberships(String projectId, {int? pageIndex, int? pageSize});
  Future<List<ProjectMembership>> getUserMemberships(String userId);
  Future<ProjectMembership> addMember({required String projectId, required String userId});
  Future<void> removeMember(String id);
}
