import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class RoleChip extends StatelessWidget {
  const RoleChip({required this.role, super.key});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(color: role.backgroundColor),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(role.icon, size: 14, color: AppColors.onSurface),
          Text(
            role.name.capitalize(),
            style: TextStyle(fontSize: 12, color: AppColors.onSurface, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

extension RoleUi on Role {
  Color get backgroundColor => switch (this) {
    Role.admin => AppColors.primary,
    Role.user => AppColors.onSurface,
  };

  IconData get icon => switch (this) {
    Role.admin => Icons.admin_panel_settings,
    Role.user => Icons.person,
  };
}
