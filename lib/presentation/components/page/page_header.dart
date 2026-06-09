import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({required this.title, this.description, this.actions, super.key});

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
            spacing: 8,
            children: [
              Text(
                title,
                softWrap: true,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (description != null)
                Text(
                  description!,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.onSurfaceMuted),
                ),
            ],
          ),
        ),
        ...?actions,
      ],
    );
  }
}
