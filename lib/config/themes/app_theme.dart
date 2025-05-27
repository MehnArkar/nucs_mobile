import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/themes/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: AppColors.colorScheme,
      scaffoldBackgroundColor: AppColors.surface,
      appBarTheme: _appBarTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme
      );

  /// App Bar Theme
  static final _appBarTheme = AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600));

  /// Text Input Field Decoration Theme
  static final _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.outline, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.outline, width: 1)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.outline, width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.primary, width: 1)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.error, width: 1)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        borderSide: BorderSide(color: AppColors.error, width: 1)),
  );

  static final _elevatedButtonTheme =ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimension.borderRadius)),
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.onSurfaceVariant,
      foregroundColor: AppColors.onPrimary,
      textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
    )
    );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style:  OutlinedButton.styleFrom(
      fixedSize: const Size(double.maxFinite, 48),
      textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.primary,
      disabledBackgroundColor: Colors.transparent,
      disabledForegroundColor: AppColors.outline,
      side: BorderSide(width: 1,color: AppColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimension.borderRadius),)
    )
  );
}
