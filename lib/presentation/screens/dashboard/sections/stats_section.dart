import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/screens/dashboard/components/stat_card.dart';
import 'package:silicohours/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class StatsSection extends ConsumerWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoursTodayAsync = ref.watch(fetchHoursLoggedTodayProvider);
    final hoursThisWeekAsync = ref.watch(fetchHoursLoggedThisWeekProvider);
    final hoursCurrentMonthAsync = ref.watch(fetchHoursLoggedCurrentMonthProvider);

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        StatCard(
          icon: const Icon(Icons.schedule),
          label: 'Hours logged today',
          value: hoursTodayAsync.when(
            data: (hours) => '${hours.toStringAsFixed(1)}h',
            loading: () => '...',
            error: (_, _) => '—',
          ),
        ),
        StatCard(
          icon: const Icon(Icons.calendar_view_week),
          label: 'Hours logged this week',
          value: hoursThisWeekAsync.when(
            data: (hours) => '${hours.toStringAsFixed(1)}h',
            loading: () => '...',
            error: (_, _) => '—',
          ),
        ),
        StatCard(
          icon: const Icon(Icons.calendar_month),
          label: 'Hours logged this month',
          value: hoursCurrentMonthAsync.when(
            data: (hours) => '${hours.toStringAsFixed(1)}h',
            loading: () => '...',
            error: (_, _) => '—',
          ),
        ),
      ],
    );
  }
}
