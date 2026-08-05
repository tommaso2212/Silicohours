import 'package:silicohours/application/application.dart';

typedef GetHoursLoggedThisWeekInput = ({String userId});

class GetHoursLoggedThisWeekUsecase extends Usecase<double, GetHoursLoggedThisWeekInput> {
  final StatsRepository _statsRepository;

  const GetHoursLoggedThisWeekUsecase({
    required this._statsRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<double> call(GetHoursLoggedThisWeekInput input) async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final from = todayDate.subtract(Duration(days: todayDate.weekday - 1));

    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(from: from, to: todayDate, userId: input.userId);

    var total = 0.0;
    for (final dayTotals in hoursByDay.values) {
      total += dayTotals.values.fold(0.0, (sum, hours) => sum + hours);
    }
    return total;
  }
}
