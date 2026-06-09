import 'package:flutter/material.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({
    required this.initials,
    this.radius = 20,
    this.backgroundColor = AppColors.primaryDark,
    this.textColor = AppColors.primary,
    super.key,
  });

  final String initials;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        initials.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: radius * 0.7,
        ),
      ),
    );
  }
}
