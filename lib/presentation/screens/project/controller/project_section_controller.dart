import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';
import 'package:silicohours/presentation/utils/debounce_mixin.dart';

part 'project_section_controller.g.dart';

@Riverpod(keepAlive: false)
class FetchProjectsFilter extends _$FetchProjectsFilter with DebounceMixin {
  @override
  String? build() => null;

  void set(String? value) => debounce(() => state = value?.isEmpty == true ? null : value);
}

@riverpod
Future<List<Project>> Function(int, int) fetchProjects(Ref ref) {
  final repo = ref.watch(projectRepositoryProvider);
  final filter = ref.watch(fetchProjectsFilterProvider);
  final usecase = GetAllProjectsUsecase(projectRepository: repo);
  return (page, limit) => usecase
      .execute((pageIndex: page, pageSize: limit, q: filter))
      .map(onResult: (result) => result, onError: (error) => []);
}

@Riverpod(keepAlive: true)
DeleteProjectUsecase deleteProjectUsecase(Ref ref) {
  return DeleteProjectUsecase(
    projectRepository: ref.watch(projectRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchProjectsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
UpdateProjectUsecase updateProjectUsecase(Ref ref) {
  return UpdateProjectUsecase(
    projectRepository: ref.watch(projectRepositoryProvider),
    successHandlers: [(_, _) async => ref.invalidate(fetchProjectsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
CreateProjectUsecase createProjectUsecase(Ref ref) {
  return CreateProjectUsecase(
    projectRepository: ref.watch(projectRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchProjectsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}
