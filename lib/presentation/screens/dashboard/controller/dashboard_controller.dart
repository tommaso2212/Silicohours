import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';

part 'dashboard_controller.g.dart';

@riverpod
Future<double> fetchHoursLoggedToday(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  return GetHoursLoggedTodayUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute(()).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<Map<DateTime, double>> fetchHoursLoggedLastWeek(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  return GetHoursLoggedLastWeekUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute(()).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<List<ProjectHours>> fetchHoursLoggedLastWeekByProject(Ref ref) {
  final statsRepository = ref.watch(statsRepositoryProvider);
  final projectRepository = ref.watch(projectRepositoryProvider);
  return GetHoursLoggedLastWeekByProjectUsecase(
    statsRepository: statsRepository,
    projectRepository: projectRepository,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute(()).map(onResult: (result) => result, onError: (error) => throw error);
}
