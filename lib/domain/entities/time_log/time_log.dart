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
    String? description,
  }) = _TimeLog;
}
