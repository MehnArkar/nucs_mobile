import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  TextTheme textTheme() => Theme.of(this).textTheme;
  ColorScheme colorScheme() => Theme.of(this).colorScheme;
  double sw() => MediaQuery.of(this).size.width;
  double sh() => MediaQuery.of(this).size.height;
}
