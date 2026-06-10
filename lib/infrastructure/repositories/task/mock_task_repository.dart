import 'package:silicohours/application/services/repositories/task_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(id: 't1', projectId: 'p1', name: 'Define wireframes'),
    const Task(id: 't2', projectId: 'p1', name: 'Implement homepage'),
    const Task(id: 't3', projectId: 'p1', name: 'Write copy'),
    const Task(id: 't4', projectId: 'p2', name: 'Design onboarding flow'),
    const Task(id: 't5', projectId: 'p2', name: 'Implement push notifications'),
    const Task(id: 't6', projectId: 'p3', name: 'Set up CI pipeline'),
    const Task(id: 't7', projectId: 'p3', name: 'Integrate analytics'),
  ];

  int _nextId = 8;

  @override
  Future<List<Task>> getProjectTasks(String projectId, {int? pageIndex, int? pageSize, String? q}) async {
    await Future.delayed(const Duration(milliseconds: 600));
    var result = _tasks.where((t) => t.projectId == projectId).toList();

    if (q != null && q.isNotEmpty) {
      final query = q.toLowerCase();
      result = result.where((t) => t.name.toLowerCase().contains(query)).toList();
    }

    if (pageIndex != null && pageSize != null) {
      final start = pageIndex * pageSize;
      if (start >= result.length) return [];
      result = result.sublist(start, (start + pageSize).clamp(0, result.length));
    }

    return result;
  }

  @override
  Future<Task> createTask({required String projectId, required String name}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final task = Task(id: 't${_nextId++}', projectId: projectId, name: name);
    _tasks.add(task);
    return task;
  }

  @override
  Future<void> deleteTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _tasks.removeWhere((t) => t.id == id);
  }
}
