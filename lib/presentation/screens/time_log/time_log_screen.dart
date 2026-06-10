import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/time_log/components/create_time_log_dialog.dart';
import 'package:silicohours/presentation/screens/time_log/controller/time_log_controller.dart';
import 'package:silicohours/presentation/screens/time_log/sections/time_logs_section.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class TimeLogScreen extends HookConsumerWidget {
  const TimeLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return AppScreen(
      scrollController: scrollController,
      actions: [
        ElevatedButton.icon(
          onPressed: () async {
            final input = await showDialog<CreateTimeLogInput>(
              context: context,
              builder: (_) => const CreateTimeLogDialog(),
            );
            if (input != null) {
              ref.read(createTimeLogUsecaseProvider).execute(input);
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('New time log'),
        ),
      ],
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            title: 'Time Logs',
            description: 'Track and manage logged hours across projects and tasks.',
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: TimeLogsSection(scrollController: scrollController),
        ),
      ],
    );
  }
}
