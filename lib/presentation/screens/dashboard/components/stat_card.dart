import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class StatCard extends StatelessWidget {
  const StatCard({required this.icon, required this.label, required this.value, super.key});

  final Widget icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 16,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: icon,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceMuted),
                ),
                Text(
                  value,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.onSurface),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
