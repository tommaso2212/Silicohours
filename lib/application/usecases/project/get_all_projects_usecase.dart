import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetAllProjectsInput = ({int? pageIndex, int? pageSize, String? q});

class GetAllProjectsUsecase extends Usecase<List<Project>, GetAllProjectsInput> {
  final ProjectRepository _projectRepository;

  const GetAllProjectsUsecase({
    required this._projectRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<Project>> call(GetAllProjectsInput input) async {
    return _projectRepository.getAllProjects(
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
      q: input.q,
    );
  }
}
