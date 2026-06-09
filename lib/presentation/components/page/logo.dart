import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/theme/app_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: AppTheme.borderRadius),
          padding: EdgeInsets.all(4),
          child: Icon(Icons.timer_outlined, color: Colors.white),
        ),
        Text('Silicohours', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
