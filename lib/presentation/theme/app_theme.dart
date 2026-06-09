import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      primaryContainer: Color.fromARGB(51, 186, 193, 192),
      onPrimary: Color.fromARGB(255, 200, 192, 192),
      secondary: AppColors.primaryLight,
      onSecondary: Colors.black,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      error: AppColors.error,
    ),
    dividerColor: AppColors.surfaceVariant,
    scaffoldBackgroundColor: AppColors.background,
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.surface, width: 304),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onSurface,
        overlayColor: AppColors.primary.withValues(alpha: 0.08),
        shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      //filled: true,
      //fillColor: AppColors.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.surfaceVariant),
      ),
      outlineBorder: BorderSide(color: AppColors.surfaceVariant),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.surfaceVariant),
    iconTheme: const IconThemeData(color: AppColors.primary),
    dialogTheme: DialogThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary.withValues(alpha: 0.08);
        } else if (states.contains(WidgetState.pressed)) {
          return AppColors.primary.withValues(alpha: 0.1);
        } else if (states.contains(WidgetState.selected)) {
          return AppColors.primary.withValues(alpha: 0.1);
        } else if (states.contains(WidgetState.focused)) {
          return AppColors.primary.withValues(alpha: 0.1);
        } else {
          return Colors.transparent;
        }
      }),
    ),
  );

  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(6));
}
