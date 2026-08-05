abstract class StatsRepository {
  // Outer key is the day (time truncated), inner key is the project id.
  Future<Map<DateTime, Map<String, double>>> getHoursByProjectPerDay({DateTime? from, DateTime? to, String? userId});
}
