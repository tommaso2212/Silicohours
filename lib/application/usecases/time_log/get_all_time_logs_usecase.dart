import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef GetAllTimeLogsInput = ({
  int? pageIndex,
  int? pageSize,
  String? projectId,
  String? taskId,
  String? userId,
});

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
      userId: input.userId,
    );
  }
}
