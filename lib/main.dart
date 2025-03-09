import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/routing/app_router.dart';
import 'package:nucs_mobile/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NUCS',
      theme: AppTheme.theme,
      routerConfig: AppRouter.router(),
    );
  }
}
