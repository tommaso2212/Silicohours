import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';

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
  final membershipRepo = ref.watch(projectMembershipRepositoryProvider);
  final filter = ref.watch(fetchProjectsFilterProvider);
  final user = ref.watch(authServiceProvider).value;
  final usecase = GetAccessibleProjectsUsecase(
    projectRepository: repo,
    projectMembershipRepository: membershipRepo,
  );
  return (page, limit) {
    if (user == null) return Future.value(<Project>[]);
    return usecase
        .execute((user: user, pageIndex: page, pageSize: limit, q: filter))
        .map(onResult: (result) => result, onError: (error) => []);
  };
}

@Riverpod(keepAlive: true)
DeleteProjectUsecase deleteProjectUsecase(Ref ref) {
  return DeleteProjectUsecase(
    projectRepository: ref.watch(projectRepositoryProvider),
    validatorHandlers: [ref.dialogConfirmHandler()],
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
