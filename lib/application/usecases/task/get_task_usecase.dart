import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetTaskInput = ({String projectId, String taskId});

class GetTaskUsecase extends Usecase<Task, GetTaskInput> {
  final TaskRepository _taskRepository;

  const GetTaskUsecase({
    required this._taskRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Task> call(GetTaskInput input) async {
    return _taskRepository.getTask(input.projectId, input.taskId);
  }
}
