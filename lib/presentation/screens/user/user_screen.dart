import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/user/controller/user_section_controller.dart';
import 'package:silicohours/presentation/screens/user/sections/users_section.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return AppScreen(
      scrollController: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: PageHeader(
            title: 'Users',
            description: 'Manage team members and their roles.',
            actions: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Search users', prefixIcon: Icon(Icons.search)),
                  onChanged: (value) => ref.read(fetchUsersFilterProvider.notifier).set(value),
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: AppSpacing.lg),
          sliver: UsersSection(scrollController: scrollController),
        ),
      ],
    );
  }
}
