import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class HoursLastWeekSection extends ConsumerWidget {
  const HoursLastWeekSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoursLastWeekAsync = ref.watch(fetchHoursLoggedLastWeekProvider);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          spacing: AppSpacing.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hours logged last week', style: Theme.of(context).textTheme.titleMedium),
            hoursLastWeekAsync.when(
              data: (hoursByDay) {
                if (hoursByDay.entries.every((element) => element.value == 0)) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Text('No hours logged', style: TextStyle(color: AppColors.onSurfaceMuted)),
                    ),
                  );
                }

                final days = hoursByDay.keys.toList();
                final values = hoursByDay.values.toList();
                return Graph.histogram(
                  values: values,
                  xGridDescriptionBuilder: (index) => MaterialLocalizations.of(context).formatShortDate(days[index]),
                  tooltipBuilder: (index) => '${values[index].toStringAsFixed(1)}h',
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
