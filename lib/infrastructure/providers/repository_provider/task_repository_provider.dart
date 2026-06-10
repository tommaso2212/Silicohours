import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/task_repository.dart';
import 'package:silicohours/infrastructure/repositories/task/mock_task_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return MockTaskRepository();
});
