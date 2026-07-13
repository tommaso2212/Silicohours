import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silicohours/application/application.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/infrastructure/infrastructure.dart';
import 'package:silicohours/presentation/components/components.dart';

class UserDropdown extends ConsumerWidget {
  const UserDropdown({
    required this.onChanged,
    this.selectedUser,
    this.label,
    this.hint,
    super.key,
  });

  final ValueChanged<User?> onChanged;
  final User? selectedUser;
  final String? label;
  final String? hint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchableDropdown<User>(
      selectedItem: selectedUser,
      label: label,
      hint: hint,
      itemLabel: (user) => user.fullName,
      leadingIconBuilder: (user) => InitialsAvatar(initials: user.initials, radius: 10),
      onSelected: onChanged,
      fetchItems: (page, pageSize, query) => GetAllUsersUsecase(
        userRepository: ref.read(userRepositoryProvider),
      ).execute((pageIndex: page, pageSize: pageSize, q: query)).map(
            onResult: (result) => result,
            onError: (_) => [],
          ),
    );
  }
}
