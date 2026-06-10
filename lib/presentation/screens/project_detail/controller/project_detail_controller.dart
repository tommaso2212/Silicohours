import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/utils/debounce_mixin.dart';

part 'project_detail_controller.g.dart';

@Riverpod(keepAlive: false)
class FetchTasksFilter extends _$FetchTasksFilter with DebounceMixin {
  @override
  String? build(String projectId) => null;

  void set(String? value) => debounce(() => state = value?.isEmpty == true ? null : value);
}

@riverpod
Future<Project> fetchProject(Ref ref, String projectId) {
  final repo = ref.watch(projectRepositoryProvider);
  return GetProjectUsecase(
    projectRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((id: projectId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<List<Task>> Function(int, int) fetchProjectTasks(Ref ref, String projectId) {
  final repo = ref.watch(taskRepositoryProvider);
  final filter = ref.watch(fetchTasksFilterProvider(projectId));
  final usecase = GetProjectTasksUsecase(taskRepository: repo);
  return (page, limit) => usecase
      .execute((projectId: projectId, pageIndex: page, pageSize: limit, q: filter))
      .map(onResult: (result) => result, onError: (error) => []);
}

@Riverpod(keepAlive: true)
CreateTaskUsecase createTaskUsecase(Ref ref) {
  return CreateTaskUsecase(
    taskRepository: ref.watch(taskRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchProjectTasksProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
DeleteTaskUsecase deleteTaskUsecase(Ref ref) {
  return DeleteTaskUsecase(
    taskRepository: ref.watch(taskRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchProjectTasksProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}
