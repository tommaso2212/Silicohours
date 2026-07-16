import 'package:silicohours/domain/domain.dart';

abstract class TimeLogRepository {
  Future<List<TimeLog>> getAll({
    int? pageIndex,
    int? pageSize,
    String? projectId,
    String? taskId,
    String? userId,
  });
  Future<TimeLog> createTimeLog({
    required String projectId,
    required String taskId,
    required String userId,
    required double hoursLogged,
    String? description,
  });
  Future<TimeLog> editTimeLog({
    required String id,
    double? hoursLogged,
    String? description,
  });
  Future<void> deleteTimeLog(String id);
}
