import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/dashboard/components/stat_card.dart';
import 'package:silicohours/presentation/screens/dashboard/controller/dashboard_controller.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

const _weekdayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

const _projectColorPalette = [
  AppColors.primary,
  Color(0xFF3B82F6),
  Color(0xFFF59E0B),
  Color(0xFFEC4899),
  Color(0xFF8B5CF6),
  Color(0xFFEF4444),
];

Color _projectColor(ProjectHours projectHours, int index) =>
    ColorHelper.fromHex(projectHours.project.colorHex) ?? _projectColorPalette[index % _projectColorPalette.length];

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoursTodayAsync = ref.watch(fetchHoursLoggedTodayProvider);
    final hoursLastWeekAsync = ref.watch(fetchHoursLoggedLastWeekProvider);
    final hoursLastWeekByProjectAsync = ref.watch(fetchHoursLoggedLastWeekByProjectProvider);

    return AppScreen(
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(title: 'Dashboard', description: 'Descrizione non troppo lunga.'),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: SliverToBoxAdapter(
            child: Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                SizedBox(
                  width: 240,
                  child: StatCard(
                    icon: const Icon(Icons.schedule),
                    label: 'Hours logged today',
                    value: hoursTodayAsync.when(
                      data: (hours) => '${hours.toStringAsFixed(1)}h',
                      loading: () => '...',
                      error: (_, _) => '—',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hours logged last week', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.lg),
                    hoursLastWeekAsync.when(
                      data: (hoursByDay) {
                        final days = hoursByDay.keys.toList();
                        final values = hoursByDay.values.toList();
                        return Graph.histogram(
                          values: values,
                          xGridDescriptionBuilder: (index) => _weekdayLabels[days[index].weekday - 1],
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
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hours by project last week', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.lg),
                    hoursLastWeekByProjectAsync.when(
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

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: AppSpacing.xl,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 160,
                              child: Graph.donut(
                                values: values,
                                colorBuilder: (index) => _projectColor(projectHours[index], index),
                                tooltipBuilder: (index) =>
                                    '${projectHours[index].project.name}: ${values[index].toStringAsFixed(1)}h',
                                constraints: const BoxConstraints(maxHeight: 160),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppSpacing.sm,
                                children: [
                                  for (var i = 0; i < projectHours.length; i++)
                                    Row(
                                      spacing: AppSpacing.sm,
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: _projectColor(projectHours[i], i),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            projectHours[i].project.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        Text(
                                          '${projectHours[i].hours.toStringAsFixed(1)}h',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceMuted),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
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
            ),
          ),
        ),
      ],
    );
  }
}
