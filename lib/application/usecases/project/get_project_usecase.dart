import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetProjectInput = ({String id});

class GetProjectUsecase extends Usecase<Project, GetProjectInput> {
  final ProjectRepository _projectRepository;

  const GetProjectUsecase({
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Project> call(GetProjectInput input) async {
    return _projectRepository.getProject(input.id);
  }
}
