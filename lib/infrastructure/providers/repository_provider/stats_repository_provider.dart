import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/services/repositories/stats_repository.dart';
import 'package:silicohours/infrastructure/providers/repository_provider/time_log_repository_provider.dart';
import 'package:silicohours/infrastructure/repositories/stats/mock_stats_repository.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  final timeLogRepository = ref.watch(timeLogRepositoryProvider);
  return MockStatsRepository(timeLogRepository);
});
