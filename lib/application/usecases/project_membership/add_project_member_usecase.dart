import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef AddProjectMemberInput = ({User actor, String projectId, String userId});

class AddProjectMemberUsecase extends Usecase<ProjectMembership, AddProjectMemberInput> {
  final ProjectMembershipRepository _projectMembershipRepository;

  const AddProjectMemberUsecase({
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<ProjectMembership> call(AddProjectMemberInput input) async {
    if (!input.actor.canManageMemberships) {
      throw AppException.httpError(
        statusCode: 403,
        title: 'Forbidden',
        message: 'Only admins can manage project members',
      );
    }

    return _projectMembershipRepository.addMember(projectId: input.projectId, userId: input.userId);
  }
}
