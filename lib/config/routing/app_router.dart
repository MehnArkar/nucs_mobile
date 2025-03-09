import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/features/home/view/pages/home_page.dart';
import 'package:nucs_mobile/features/index/view/pages/index_page.dart';

final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> academicNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> blogEstateNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> clubNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static GoRouter router() => GoRouter(navigatorKey: parentNavigatorKey,
          initialLocation: AppRoutes.home,
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (_,__,navShell)=>IndexPage(navigationShell: navShell),
              branches: [
                StatefulShellBranch(routes: [home])
              ]
            )
          ]
          );

  static GoRoute home = GoRoute(
    path: AppRoutes.homePath,
    builder:(context,state)=>HomePage()
  );

}
