import 'package:silicohours/application/application.dart';

typedef DeleteTaskInput = ({String id});

class DeleteTaskUsecase extends Usecase<void, DeleteTaskInput> {
  final TaskRepository _taskRepository;

  const DeleteTaskUsecase({
    required this._taskRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(DeleteTaskInput input) async {
    return _taskRepository.deleteTask(input.id);
  }
}
