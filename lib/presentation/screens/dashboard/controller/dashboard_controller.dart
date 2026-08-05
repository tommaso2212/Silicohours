import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/services/auth_service/auth_service.dart';
import 'package:silicohours/presentation/services/dialog_service/dialog_service.dart';

part 'dashboard_controller.g.dart';

@riverpod
Future<double> fetchHoursLoggedToday(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(0);
  return GetHoursLoggedTodayUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<double> fetchHoursLoggedThisWeek(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(0);
  return GetHoursLoggedThisWeekUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<double> fetchHoursLoggedCurrentMonth(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(0);
  return GetHoursLoggedCurrentMonthUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<Map<DateTime, double>> fetchHoursLoggedLastWeek(Ref ref) {
  final repo = ref.watch(statsRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(const {});
  return GetHoursLoggedLastWeekUsecase(
    statsRepository: repo,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<List<ProjectHours>> fetchHoursLoggedLastWeekByProject(Ref ref) {
  final statsRepository = ref.watch(statsRepositoryProvider);
  final projectRepository = ref.watch(projectRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(const []);
  return GetHoursLoggedLastWeekByProjectUsecase(
    statsRepository: statsRepository,
    projectRepository: projectRepository,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<List<ProjectWeekHours>> fetchHoursLoggedCurrentWeekByProject(Ref ref) {
  final statsRepository = ref.watch(statsRepositoryProvider);
  final projectRepository = ref.watch(projectRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(const []);
  return GetHoursLoggedCurrentWeekByProjectUsecase(
    statsRepository: statsRepository,
    projectRepository: projectRepository,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}

@riverpod
Future<List<ProjectHours>> fetchHoursLoggedCurrentMonthByProject(Ref ref) {
  final statsRepository = ref.watch(statsRepositoryProvider);
  final projectRepository = ref.watch(projectRepositoryProvider);
  final userId = ref.watch(authServiceProvider).value?.id;
  if (userId == null) return Future.value(const []);
  return GetHoursLoggedCurrentMonthByProjectUsecase(
    statsRepository: statsRepository,
    projectRepository: projectRepository,
    errorHandlers: [ref.dialogExceptionHandler()],
  ).execute((userId: userId)).map(onResult: (result) => result, onError: (error) => throw error);
}
