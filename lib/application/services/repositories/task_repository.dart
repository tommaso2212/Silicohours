import 'package:silicohours/domain/domain.dart';

abstract class TaskRepository {
  Future<List<Task>> getProjectTasks(String projectId, {int? pageIndex, int? pageSize, String? q});
  Future<Task> createTask({required String projectId, required String name});
  Future<void> deleteTask(String id);
}
