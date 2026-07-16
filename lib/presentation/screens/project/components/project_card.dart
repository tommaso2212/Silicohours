import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, this.actionMenu, this.onTap, super.key});

  final Project project;
  final Widget? actionMenu;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppTheme.borderRadius,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 6, color: ColorHelper.fromHex(project.colorHex) ?? Colors.transparent),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '€${project.hourPrice.toStringAsFixed(2)}/h',
                              style: const TextStyle(color: AppColors.onSurfaceMuted, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      ?actionMenu,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
