import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:silicohours/presentation/screens/dashboard/utils/project_color.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

const _weekdayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class HoursByProjectCurrentWeekSection extends ConsumerWidget {
  const HoursByProjectCurrentWeekSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoursCurrentWeekByProjectAsync = ref.watch(fetchHoursLoggedCurrentWeekByProjectProvider);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          spacing: AppSpacing.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hours by project this week', style: Theme.of(context).textTheme.titleMedium),
            hoursCurrentWeekByProjectAsync.when(
              data: (projectHours) {
                if (projectHours.isEmpty) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('No hours logged', style: TextStyle(color: AppColors.onSurfaceMuted)),
                    ),
                  );
                }

                final series = [for (final ph in projectHours) ph.hoursByDay];

                return Graph.line(
                  series: series,
                  colorBuilder: (index) => projectColor(projectHours[index].project, index),
                  xGridDescriptionBuilder: (index) => _weekdayLabels[index],
                  seriesTooltipBuilder: (seriesIndex, valueIndex) {
                    final value = series[seriesIndex][valueIndex];
                    return '${projectHours[seriesIndex].project.name} · ${value.toStringAsFixed(1)}h';
                  },
                );
              },
              loading: () => const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
              error: (_, _) => SizedBox(
                height: 200,
                child: Center(
                  child: Text('—', style: TextStyle(color: AppColors.onSurfaceMuted)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
