import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';

part 'time_log_controller.g.dart';

@riverpod
Future<List<TimeLog>> Function(int, int) fetchTimeLogs(Ref ref) {
  final repo = ref.watch(timeLogRepositoryProvider);
  final actor = ref.watch(authServiceProvider).value;
  final usecase = GetAllTimeLogsUsecase(timeLogRepository: repo);
  return (page, limit) {
    if (actor == null) return Future.value(<TimeLog>[]);
    return usecase
        .execute((
          actor: actor,
          pageIndex: page,
          pageSize: limit,
          projectId: null,
          taskId: null,
          userId: null,
          date: null,
        ))
        .map(onResult: (result) => result, onError: (error) => []);
  };
}

@Riverpod(keepAlive: true)
CreateTimeLogUsecase createTimeLogUsecase(Ref ref) {
  return CreateTimeLogUsecase(
    timeLogRepository: ref.watch(timeLogRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchTimeLogsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
DeleteTimeLogUsecase deleteTimeLogUsecase(Ref ref) {
  return DeleteTimeLogUsecase(
    timeLogRepository: ref.watch(timeLogRepositoryProvider),
    validatorHandlers: [ref.dialogConfirmHandler()],
    successHandlers: [(_, _) async => ref.invalidate(fetchTimeLogsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}

@Riverpod(keepAlive: true)
EditTimeLogUsecase editTimeLogUsecase(Ref ref) {
  return EditTimeLogUsecase(
    timeLogRepository: ref.watch(timeLogRepositoryProvider),
    successHandlers: [ref.dialogSuccessHandler(), (_, _) async => ref.invalidate(fetchTimeLogsProvider)],
    errorHandlers: [ref.dialogExceptionHandler()],
  );
}
