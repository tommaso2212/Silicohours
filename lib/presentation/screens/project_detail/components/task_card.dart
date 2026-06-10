import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.task, this.actionMenu, this.onTap, super.key});

  final Task task;
  final Widget? actionMenu;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  task.name,
                  style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                ),
              ),
              ?actionMenu,
            ],
          ),
        ),
      ),
    );
  }
}
