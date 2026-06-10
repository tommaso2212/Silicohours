import 'package:silicohours/application/application.dart';

typedef DeleteTimeLogInput = ({String id});

class DeleteTimeLogUsecase extends Usecase<void, DeleteTimeLogInput> {
  final TimeLogRepository _timeLogRepository;

  const DeleteTimeLogUsecase({
    required this._timeLogRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<void> call(DeleteTimeLogInput input) async {
    return _timeLogRepository.deleteTimeLog(input.id);
  }
}
