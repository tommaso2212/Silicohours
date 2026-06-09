import 'package:silicohours/application/services/repositories/project_repository.dart';
import 'package:silicohours/domain/domain.dart';

class MockProjectRepository implements ProjectRepository {
  final List<Project> _projects = [
    const Project(id: 'p1', name: 'Website Redesign', hourPrice: 95.0),
    const Project(id: 'p2', name: 'Mobile App – iOS', hourPrice: 120.0),
    const Project(id: 'p3', name: 'Mobile App – Android', hourPrice: 110.0),
    const Project(id: 'p4', name: 'Internal Dashboard', hourPrice: 85.0),
    const Project(id: 'p5', name: 'API Gateway Migration', hourPrice: 130.0),
    const Project(id: 'p6', name: 'CRM Integration', hourPrice: 100.0),
    const Project(id: 'p7', name: 'Data Warehouse Setup', hourPrice: 145.0),
    const Project(id: 'p8', name: 'DevOps & CI/CD Pipeline', hourPrice: 125.0),
    const Project(id: 'p9', name: 'E-commerce Platform', hourPrice: 105.0),
    const Project(id: 'p10', name: 'Security Audit', hourPrice: 160.0),
    const Project(id: 'p11', name: 'Brand Identity Design', hourPrice: 80.0),
    const Project(id: 'p12', name: 'Legacy System Refactor', hourPrice: 115.0),
  ];

  int _nextId = 13;

  @override
  Future<List<Project>> getAllProjects({int? pageIndex, int? pageSize, String? q}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    var result = _projects.toList();

    if (q != null && q.isNotEmpty) {
      final query = q.toLowerCase();
      result = result.where((p) => p.name.toLowerCase().contains(query)).toList();
    }

    if (pageIndex != null && pageSize != null) {
      final start = pageIndex * pageSize;
      if (start >= result.length) return [];
      result = result.skip(start).take(pageSize).toList();
    }

    return result;
  }

  @override
  Future<Project> getProject(String id) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _projects.firstWhere(
      (p) => p.id == id,
      orElse: () => throw AppException.httpError(
        statusCode: 404,
        title: 'Not Found',
        message: 'Project $id not found',
      ),
    );
  }

  @override
  Future<Project> createProject({required String name, required double hourPrice}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final project = Project(id: 'p${_nextId++}', name: name, hourPrice: hourPrice);
    _projects.add(project);
    return project;
  }

  @override
  Future<Project> updateProject(Project project) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _projects.indexWhere((p) => p.id == project.id);
    if (index == -1) {
      throw AppException.httpError(statusCode: 404, title: 'Not Found', message: 'Project ${project.id} not found');
    }
    _projects[index] = project;
    return project;
  }

  @override
  Future<void> deleteProject(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _projects.removeWhere((p) => p.id == id);
  }
}
