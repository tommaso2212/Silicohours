import 'package:silicohours/application/application.dart';

typedef GetHoursLoggedTodayInput = ({String userId});

class GetHoursLoggedTodayUsecase extends Usecase<double, GetHoursLoggedTodayInput> {
  final StatsRepository _statsRepository;

  const GetHoursLoggedTodayUsecase({
    required this._statsRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<double> call(GetHoursLoggedTodayInput input) async {
    final today = DateTime.now();
    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(from: today, to: today, userId: input.userId);

    var total = 0.0;
    for (final dayTotals in hoursByDay.values) {
      total += dayTotals.values.fold(0.0, (sum, hours) => sum + hours);
    }
    return total;
  }
}
