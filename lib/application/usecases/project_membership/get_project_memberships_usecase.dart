import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetProjectMembershipsInput = ({String projectId, int? pageIndex, int? pageSize});

class GetProjectMembershipsUsecase extends Usecase<List<ProjectMembership>, GetProjectMembershipsInput> {
  final ProjectMembershipRepository _projectMembershipRepository;

  const GetProjectMembershipsUsecase({
    required this._projectMembershipRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<ProjectMembership>> call(GetProjectMembershipsInput input) async {
    return _projectMembershipRepository.getProjectMemberships(
      input.projectId,
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
    );
  }
}
