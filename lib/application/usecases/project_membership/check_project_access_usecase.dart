import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef CheckProjectAccessInput = ({User user, String projectId});

/// Answers whether a single project is in the user's scope — always true for
/// admins, membership based for everyone else.
class CheckProjectAccessUsecase extends Usecase<bool, CheckProjectAccessInput> {
  final ProjectMembershipRepository _projectMembershipRepository;

  const CheckProjectAccessUsecase({
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<bool> call(CheckProjectAccessInput input) async {
    if (input.user.canManageAllProjects) return true;

    final memberships = await _projectMembershipRepository.getUserMemberships(input.user.id);
    return input.user.canAccessProject(input.projectId, memberships);
  }
}
