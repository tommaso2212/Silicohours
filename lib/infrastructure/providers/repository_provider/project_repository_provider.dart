import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/project_repository.dart';
import 'package:silicohours/infrastructure/repositories/project/mock_project_repository.dart';

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return MockProjectRepository();
});
