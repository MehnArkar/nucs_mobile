import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static final ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: Color(0xFF008083)).copyWith(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: onPrimary,
          surface: surface,
          onSurface: onSurface,
          surfaceBright: surfaceBright,
          onSurfaceVariant: onSurfaceVariant,
          outline: outline,
          error: error);

  static Color primary = Color(0xFF008083);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF3F4F6);
  static const Color onSurface = Color(0xFF000000);
  static const Color surfaceBright = Color(0xFFFFFFFF);
  static const Color onSurfaceVariant = Color(0xFFD9D9D9);
  static const Color outline = Color(0xFFE2E4E9);
  static const Color error = Colors.red;
}
