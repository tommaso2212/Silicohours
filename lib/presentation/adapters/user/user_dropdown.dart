import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/adapters/user/user_name.dart';
import 'package:silicohours/presentation/components/components.dart';

class UserDropdown extends ConsumerWidget {
  const UserDropdown({required this.controller, this.showRole = false, super.key});

  final DropdownController<User> controller;
  final bool showRole;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationDropdown<User>(
      label: 'User',
      controller: controller,
      fetchItems: (page, pageSize, q) => GetAllUsersUsecase(
        userRepository: ref.read(userRepositoryProvider),
      ).execute((pageIndex: page, pageSize: pageSize, q: q)).map(onResult: (result) => result, onError: (_) => []),
      itemBuilder: (item) => UserName.user(user: item, showRole: showRole),
    );
  }
}
