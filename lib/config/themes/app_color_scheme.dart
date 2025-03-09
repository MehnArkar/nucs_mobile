import 'dart:ui';

import 'package:flutter/material.dart';

class AppColorScheme {
  AppColorScheme._();

  static final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Color(0xFF008083))
          .copyWith(
            brightness: Brightness.light,
            primary : Color(0xFF008083),
            onPrimary: Color(0xFFFFFFFF),
            surface : Color(0xFFF3F4F6),
            surfaceBright: Color(0xFFFFFFFF),
            onSurfaceVariant: Color(0xFFD9D9D9),
            outline: Color(0xFFE2E4E9)
            );
}
