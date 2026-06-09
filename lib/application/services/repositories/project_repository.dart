import 'package:silicohours/domain/domain.dart';

abstract class ProjectRepository {
  Future<List<Project>> getAllProjects({int? pageIndex, int? pageSize, String? q});
  Future<Project> getProject(String id);
  Future<Project> createProject({required String name, required double hourPrice});
  Future<Project> updateProject(Project project);
  Future<void> deleteProject(String id);
}
