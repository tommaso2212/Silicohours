import 'package:silicohours/application/services/repositories/project_membership_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockProjectMembershipRepository implements ProjectMembershipRepository {
  final List<ProjectMembership> _memberships = [
    const ProjectMembership(id: 'pm1', projectId: 'p1', userId: '2'),
    const ProjectMembership(id: 'pm2', projectId: 'p1', userId: '3'),
    const ProjectMembership(id: 'pm3', projectId: 'p2', userId: '2'),
    const ProjectMembership(id: 'pm4', projectId: 'p2', userId: '4'),
    const ProjectMembership(id: 'pm5', projectId: 'p3', userId: '5'),
    const ProjectMembership(id: 'pm6', projectId: 'p4', userId: '3'),
    const ProjectMembership(id: 'pm7', projectId: 'p4', userId: '7'),
    const ProjectMembership(id: 'pm8', projectId: 'p5', userId: '8'),
    const ProjectMembership(id: 'pm9', projectId: 'p6', userId: '9'),
    const ProjectMembership(id: 'pm10', projectId: 'p7', userId: '10'),
    const ProjectMembership(id: 'pm11', projectId: 'p8', userId: '4'),
    const ProjectMembership(id: 'pm12', projectId: 'p9', userId: '5'),
  ];

  int _nextId = 13;

  @override
  Future<List<ProjectMembership>> getProjectMemberships(String projectId, {int? pageIndex, int? pageSize}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var result = _memberships.where((m) => m.projectId == projectId).toList();

    if (pageIndex != null && pageSize != null) {
      final start = pageIndex * pageSize;
      if (start >= result.length) return [];
      result = result.skip(start).take(pageSize).toList();
    }

    return result;
  }

  @override
  Future<List<ProjectMembership>> getUserMemberships(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _memberships.where((m) => m.userId == userId).toList();
  }

  @override
  Future<ProjectMembership> addMember({required String projectId, required String userId}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final existing = _memberships.where((m) => m.projectId == projectId && m.userId == userId).firstOrNull;
    if (existing != null) {
      throw AppException.httpError(
        statusCode: 409,
        title: 'Conflict',
        message: 'User $userId is already a member of project $projectId',
      );
    }

    final membership = ProjectMembership(id: 'pm${_nextId++}', projectId: projectId, userId: userId);
    _memberships.add(membership);
    return membership;
  }

  @override
  Future<void> removeMember(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _memberships.removeWhere((m) => m.id == id);
  }
}
