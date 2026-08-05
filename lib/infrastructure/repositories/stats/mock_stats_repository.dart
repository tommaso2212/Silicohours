import 'package:silicohours/application/services/repositories/stats_repository.dart';
import 'package:silicohours/application/services/repositories/time_log_repository.dart';

class MockStatsRepository implements StatsRepository {
  final TimeLogRepository _timeLogRepository;

  MockStatsRepository(this._timeLogRepository);

  @override
  Future<Map<DateTime, Map<String, double>>> getHoursByProjectPerDay({
    DateTime? from,
    DateTime? to,
    String? userId,
  }) async {
    final logs = await _timeLogRepository.getAll(userId: userId);

    final result = <DateTime, Map<String, double>>{};
    for (final log in logs) {
      final day = DateTime(log.date.year, log.date.month, log.date.day);
      if (from != null && day.isBefore(DateTime(from.year, from.month, from.day))) continue;
      if (to != null && day.isAfter(DateTime(to.year, to.month, to.day))) continue;

      final dayTotals = result.putIfAbsent(day, () => {});
      dayTotals[log.projectId] = (dayTotals[log.projectId] ?? 0) + log.hoursLogged;
    }

    return result;
  }
}
