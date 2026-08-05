import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/dashboard/sections/hours_by_project_current_month_section.dart';
import 'package:silicohours/presentation/screens/dashboard/sections/hours_by_project_current_week_section.dart';
import 'package:silicohours/presentation/screens/dashboard/sections/hours_last_week_section.dart';
import 'package:silicohours/presentation/screens/dashboard/sections/stats_section.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScreen(
      slivers: [
        SliverToBoxAdapter(child: PageHeader(title: 'Dashboard')),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: SliverToBoxAdapter(child: const StatsSection()),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          sliver: SliverToBoxAdapter(child: const HoursLastWeekSection()),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          sliver: SliverToBoxAdapter(child: const HoursByProjectCurrentWeekSection()),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.md),
          sliver: SliverToBoxAdapter(child: const HoursByProjectCurrentMonthSection()),
        ),
      ],
    );
  }
}
