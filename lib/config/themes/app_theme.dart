import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/themes/app_color_scheme.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    useMaterial3: true, 
    colorScheme: AppColorScheme.colorScheme,
   
  );
}
