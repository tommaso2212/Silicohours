import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_spacing.dart';

class RoleChip extends StatelessWidget {
  const RoleChip({required this.role, super.key});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: role.backgroundColor),
      child: Text(
        role.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: role.textColor),
      ),
    );
  }
}

extension RoleUi on Role {
  Color get backgroundColor => switch (this) {
    Role.admin => AppColors.primaryDark,
    Role.user => AppColors.surfaceVariant,
  };

  Color get textColor => switch (this) {
    Role.admin => AppColors.primaryLight,
    Role.user => AppColors.onSurfaceMuted,
  };

  IconData get icon => switch (this) {
    Role.admin => Icons.admin_panel_settings,
    Role.user => Icons.person,
  };
}
