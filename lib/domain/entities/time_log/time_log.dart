import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_log.freezed.dart';

@freezed
abstract class TimeLog with _$TimeLog {
  const factory TimeLog({
    required String id,
    required String projectId,
    required String taskId,
    required String userId,
    required double hoursLogged,
    required DateTime date,
    String? description,
  }) = _TimeLog;
}

extension TimeLogFormatter on TimeLog {
  String get formatDate =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(4, '0')}';
}
