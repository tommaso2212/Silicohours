import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/user/role_chip.dart';
import 'package:silicohours/presentation/components/components.dart';
import 'package:silicohours/presentation/screens/user/components/user_card.dart';
import 'package:silicohours/presentation/screens/user/controller/user_section_controller.dart';
import 'package:silicohours/presentation/theme/app_breakpoints.dart';

class UsersSection extends ConsumerWidget {
  const UsersSection({required this.scrollController, super.key});

  final ScrollController scrollController;

  static const _columns = ['Name', 'Email', 'Role', ''];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchItems = ref.watch(fetchUsersProvider);

    return context.onMobile(
      onMobile: () => PaginationList.sliver(
        scrollController: scrollController,
        fetchItems: fetchItems,
        itemBuilder: (item) => UserCard(
          user: item,
          actionMenu: _UserActionMenu(user: item),
        ),
      ),
      orElse: () => SliverToBoxAdapter(
        child: Card(
          child: PaginationDataTable(
            scrollController: scrollController,
            fetchItems: fetchItems,
            columnsNumber: _columns.length,
            headerBuilder: (index) => Text(_columns[index]),
            cellBuilder: (index, user) => switch (index) {
              0 => Text(user.fullName ?? '—'),
              1 => Text(user.mail ?? '—'),
              2 => RoleChip(role: user.role),
              3 => Align(
                alignment: Alignment.centerRight,
                child: _UserActionMenu(user: user),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}

class _UserActionMenu extends ConsumerWidget {
  const _UserActionMenu({required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionMenu(
      actions: [
        MenuAction(
          label: switch (user.role) {
            Role.admin => 'Make User',
            Role.user => 'Make Admin',
          },
          action: () => ref.read(editUserRoleUsecaseProvider).execute((
            id: user.id,
            role: switch (user.role) {
              Role.admin => Role.user,
              Role.user => Role.admin,
            },
          )),
          icon: Icon(user.role.icon),
        ),
        MenuAction(
          label: 'Delete',
          action: () => ref.read(deleteUserUsecaseProvider).execute((id: user.id)),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
