import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef CreateTimeLogInput = ({
  String projectId,
  String taskId,
  String userId,
  double hoursLogged,
  String? description,
});

class CreateTimeLogUsecase extends Usecase<TimeLog, CreateTimeLogInput> {
  final TimeLogRepository _timeLogRepository;

  const CreateTimeLogUsecase({
    required this._timeLogRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<TimeLog> call(CreateTimeLogInput input) async {
    return _timeLogRepository.createTimeLog(
      projectId: input.projectId,
      taskId: input.taskId,
      userId: input.userId,
      hoursLogged: input.hoursLogged,
      description: input.description,
    );
  }
}
