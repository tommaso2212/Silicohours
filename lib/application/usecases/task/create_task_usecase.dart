import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef CreateTaskInput = ({String projectId, String name});

class CreateTaskUsecase extends Usecase<Task, CreateTaskInput> {
  final TaskRepository _taskRepository;

  const CreateTaskUsecase({
    required this._taskRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Task> call(CreateTaskInput input) async {
    return _taskRepository.createTask(
      projectId: input.projectId,
      name: input.name,
    );
  }
}
