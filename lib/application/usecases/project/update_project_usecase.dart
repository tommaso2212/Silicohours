import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef UpdateProjectInput = ({Project project});

class UpdateProjectUsecase extends Usecase<Project, UpdateProjectInput> {
  final ProjectRepository _projectRepository;

  const UpdateProjectUsecase({
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Project> call(UpdateProjectInput input) async {
    return _projectRepository.updateProject(input.project);
  }
}
