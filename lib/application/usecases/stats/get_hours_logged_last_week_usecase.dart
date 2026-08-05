import 'package:silicohours/application/application.dart';

typedef GetHoursLoggedLastWeekInput = ({String userId});

class GetHoursLoggedLastWeekUsecase extends Usecase<Map<DateTime, double>, GetHoursLoggedLastWeekInput> {
  final StatsRepository _statsRepository;

  const GetHoursLoggedLastWeekUsecase({
    required this._statsRepository,
    super.successHandlers,
    super.errorHandlers,
    super.validatorHandlers,
  });

  @override
  Future<Map<DateTime, double>> call(GetHoursLoggedLastWeekInput input) async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final from = todayDate.subtract(const Duration(days: 6));

    final hoursByDay = await _statsRepository.getHoursByProjectPerDay(from: from, to: todayDate, userId: input.userId);

    return {
      for (var i = 0; i < 7; i++)
        from.add(Duration(days: i)): (hoursByDay[from.add(Duration(days: i))] ?? const {}).values.fold(
          0.0,
          (sum, hours) => sum + hours,
        ),
    };
  }
}
