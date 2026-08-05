import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef RemoveProjectMemberInput = ({User actor, String id});

class RemoveProjectMemberUsecase extends Usecase<void, RemoveProjectMemberInput> {
  final ProjectMembershipRepository _projectMembershipRepository;

  const RemoveProjectMemberUsecase({
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(RemoveProjectMemberInput input) async {
    if (!input.actor.canManageMemberships) {
      throw AppException.httpError(
        statusCode: 403,
        title: 'Forbidden',
        message: 'Only admins can manage project members',
      );
    }

    return _projectMembershipRepository.removeMember(input.id);
  }
}
