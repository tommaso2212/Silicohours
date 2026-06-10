import 'package:silicohours/application/services/repositories/time_log_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockTimeLogRepository implements TimeLogRepository {
  final List<TimeLog> _logs = [
    const TimeLog(id: 'tl1', projectId: 'p1', taskId: 't1', userId: '1', hoursLogged: 3.0, description: 'Initial wireframe review'),
    const TimeLog(id: 'tl2', projectId: 'p1', taskId: 't2', userId: '2', hoursLogged: 5.5),
    const TimeLog(id: 'tl3', projectId: 'p1', taskId: 't2', userId: '3', hoursLogged: 2.0, description: 'Homepage layout adjustments'),
    const TimeLog(id: 'tl4', projectId: 'p1', taskId: 't3', userId: '1', hoursLogged: 1.5),
    const TimeLog(id: 'tl5', projectId: 'p2', taskId: 't4', userId: '4', hoursLogged: 4.0, description: 'Onboarding screens design'),
    const TimeLog(id: 'tl6', projectId: 'p2', taskId: 't5', userId: '5', hoursLogged: 6.0),
    const TimeLog(id: 'tl7', projectId: 'p3', taskId: 't6', userId: '2', hoursLogged: 3.5, description: 'CI pipeline configuration'),
    const TimeLog(id: 'tl8', projectId: 'p3', taskId: 't7', userId: '3', hoursLogged: 2.5),
  ];

  int _nextId = 9;

  @override
  Future<List<TimeLog>> getAll({
    int? pageIndex,
    int? pageSize,
    String? projectId,
    String? taskId,
    String? userId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    var result = _logs.toList();

    if (projectId != null) result = result.where((l) => l.projectId == projectId).toList();
    if (taskId != null) result = result.where((l) => l.taskId == taskId).toList();
    if (userId != null) result = result.where((l) => l.userId == userId).toList();

    if (pageIndex != null && pageSize != null) {
      final start = pageIndex * pageSize;
      if (start >= result.length) return [];
      result = result.sublist(start, (start + pageSize).clamp(0, result.length));
    }

    return result;
  }

  @override
  Future<TimeLog> createTimeLog({
    required String projectId,
    required String taskId,
    required String userId,
    required double hoursLogged,
    String? description,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final log = TimeLog(
      id: 'tl${_nextId++}',
      projectId: projectId,
      taskId: taskId,
      userId: userId,
      hoursLogged: hoursLogged,
      description: description,
    );
    _logs.add(log);
    return log;
  }

  @override
  Future<void> deleteTimeLog(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _logs.removeWhere((l) => l.id == id);
  }
}
