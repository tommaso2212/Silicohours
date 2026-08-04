import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetUserMembershipsInput = ({String userId});

class GetUserMembershipsUsecase extends Usecase<List<ProjectMembership>, GetUserMembershipsInput> {
  final ProjectMembershipRepository _projectMembershipRepository;

  const GetUserMembershipsUsecase({
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<ProjectMembership>> call(GetUserMembershipsInput input) async {
    return _projectMembershipRepository.getUserMemberships(input.userId);
  }
}
