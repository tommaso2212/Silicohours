import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/adapters/user/role_chip.dart';
import 'package:silicohours/presentation/components/components.dart';

import 'package:silicohours/presentation/theme/app_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({required this.user, this.actionMenu, super.key});

  final User user;
  final Widget? actionMenu;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            InitialsAvatar(initials: user.initials),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName ?? '—',
                    style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                  ),
                  if (user.mail != null)
                    Text(user.mail!, style: const TextStyle(color: AppColors.onSurfaceMuted, fontSize: 12)),
                ],
              ),
            ),
            RoleChip(role: user.role),
            ?actionMenu,
          ],
        ),
      ),
    );
  }
}
