import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:silicohours/presentation/screens/dashboard/utils/project_color.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class HoursByProjectCurrentMonthSection extends ConsumerWidget {
  const HoursByProjectCurrentMonthSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoursCurrentMonthByProjectAsync = ref.watch(fetchHoursLoggedCurrentMonthByProjectProvider);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          spacing: AppSpacing.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hours by project this month', style: Theme.of(context).textTheme.titleMedium),
            hoursCurrentMonthByProjectAsync.when(
              data: (projectHours) {
                if (projectHours.isEmpty) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('No hours logged', style: TextStyle(color: AppColors.onSurfaceMuted)),
                    ),
                  );
                }

                final values = [for (final ph in projectHours) ph.hours];

                return Graph.donut(
                  values: values,
                  colorBuilder: (index) => projectColor(projectHours[index].project, index),
                  tooltipBuilder: (index) =>
                      '${projectHours[index].project.name}: ${values[index].toStringAsFixed(1)}h',
                  constraints: const BoxConstraints(maxHeight: 160),
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
