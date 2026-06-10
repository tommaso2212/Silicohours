import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/time_log_repository.dart';
import 'package:silicohours/infrastructure/repositories/time_log/mock_time_log_repository.dart';

final timeLogRepositoryProvider = Provider<TimeLogRepository>((ref) {
  return MockTimeLogRepository();
});
