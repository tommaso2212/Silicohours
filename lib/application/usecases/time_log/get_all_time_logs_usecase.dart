import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetAllTimeLogsInput = ({
  User actor,
  int? pageIndex,
  int? pageSize,
  String? projectId,
  String? taskId,
  String? userId,
  DateTime? date,
});

/// Returns every time log when the actor is an admin, otherwise only the
/// actor's own time logs, regardless of the requested [GetAllTimeLogsInput.userId].
class GetAllTimeLogsUsecase extends Usecase<List<TimeLog>, GetAllTimeLogsInput> {
  final TimeLogRepository _timeLogRepository;

  const GetAllTimeLogsUsecase({
    required this._timeLogRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<List<TimeLog>> call(GetAllTimeLogsInput input) async {
    return _timeLogRepository.getAll(
      pageIndex: input.pageIndex,
      pageSize: input.pageSize,
      projectId: input.projectId,
      taskId: input.taskId,
      userId: input.actor.canViewAllTimeLogs ? input.userId : input.actor.id,
      date: input.date,
    );
  }
}
