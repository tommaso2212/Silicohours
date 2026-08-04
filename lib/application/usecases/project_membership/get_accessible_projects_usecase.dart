import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetAccessibleProjectsInput = ({User user, int? pageIndex, int? pageSize, String? q});

/// Returns every project when the user is an admin, otherwise only the projects
/// the user has a [ProjectMembership] for.
class GetAccessibleProjectsUsecase extends Usecase<List<Project>, GetAccessibleProjectsInput> {
  final ProjectRepository _projectRepository;
  final ProjectMembershipRepository _projectMembershipRepository;

  const GetAccessibleProjectsUsecase({
    required this._projectRepository,
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<Project>> call(GetAccessibleProjectsInput input) async {
    if (input.user.canManageAllProjects) {
      return _projectRepository.getAllProjects(pageIndex: input.pageIndex, pageSize: input.pageSize, q: input.q);
    }

    final memberships = await _projectMembershipRepository.getUserMemberships(input.user.id);
    final projectIds = memberships.projectIds;
    if (projectIds.isEmpty) return [];

    return _projectRepository.getAllProjects(
      ids: projectIds,
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
      q: input.q,
    );
  }
}
