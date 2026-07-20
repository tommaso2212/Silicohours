import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';

typedef EditTimeLogInput = ({String id, DateTime? date, double? hoursLogged, String? description});

class EditTimeLogUsecase extends Usecase<TimeLog, EditTimeLogInput> {
  final TimeLogRepository _timeLogRepository;

  const EditTimeLogUsecase({
    required this._timeLogRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<TimeLog> call(EditTimeLogInput input) async {
    return _timeLogRepository.editTimeLog(
      id: input.id,
      date: input.date,
      hoursLogged: input.hoursLogged,
      description: input.description,
    );
  }
}
