import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetProjectTasksInput = ({String projectId, int? pageIndex, int? pageSize, String? q});

class GetProjectTasksUsecase extends Usecase<List<Task>, GetProjectTasksInput> {
  final TaskRepository _taskRepository;

  const GetProjectTasksUsecase({
    required this._taskRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<Task>> call(GetProjectTasksInput input) async {
    return _taskRepository.getProjectTasks(
      input.projectId,
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
      q: input.q,
    );
  }
}
