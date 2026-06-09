import 'package:silicohours/application/application.dart';

typedef DeleteProjectInput = ({String id});

class DeleteProjectUsecase extends Usecase<void, DeleteProjectInput> {
  final ProjectRepository _projectRepository;

  const DeleteProjectUsecase({
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(DeleteProjectInput input) async {
    return _projectRepository.deleteProject(input.id);
  }
}
