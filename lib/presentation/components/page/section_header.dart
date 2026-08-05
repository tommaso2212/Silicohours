import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({required this.title, this.description, this.actions, super.key});

  final String title;
  final String? description;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 4,
            children: [
              Text(
                title,
                softWrap: true,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              if (description != null)
                Text(
                  description!,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceMuted),
                ),
            ],
          ),
        ),
        ...?actions,
      ],
    );
  }
}
