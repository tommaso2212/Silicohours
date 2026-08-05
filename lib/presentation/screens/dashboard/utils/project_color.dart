import 'package:flutter/material.dart';
import 'package:silicohours/domain/domain.dart';
import 'package:silicohours/presentation/theme/app_colors.dart';
import 'package:silicohours/presentation/utils/color_helper.dart';

const projectColorPalette = [
  AppColors.primary,
  Color(0xFF3B82F6),
  Color(0xFFF59E0B),
  Color(0xFFEC4899),
  Color(0xFF8B5CF6),
  Color(0xFFEF4444),
];

Color projectColor(Project project, int index) =>
    ColorHelper.fromHex(project.colorHex) ?? projectColorPalette[index % projectColorPalette.length];
