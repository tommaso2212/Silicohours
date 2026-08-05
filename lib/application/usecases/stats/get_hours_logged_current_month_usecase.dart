import 'package:silicohours/application/application.dart';

typedef GetHoursLoggedCurrentMonthInput = ({String userId});

class GetHoursLoggedCurrentMonthUsecase extends Usecase<double, GetHoursLoggedCurrentMonthInput> {
  final StatsRepository _statsRepository;

  const GetHoursLoggedCurrentMonthUsecase({
    required this._statsRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<double> call(GetHoursLoggedCurrentMonthInput input) async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final from = DateTime(today.year, today.month, 1);

    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(from: from, to: todayDate, userId: input.userId);

    var total = 0.0;
    for (final dayTotals in hoursByDay.values) {
      total += dayTotals.values.fold(0.0, (sum, hours) => sum + hours);
    }
    return total;
  }
}
