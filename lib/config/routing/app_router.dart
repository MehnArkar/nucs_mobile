import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/features/academic/views/pages/academic_page.dart';
import 'package:nucs_mobile/features/blog/views/pages/blog_page.dart';
import 'package:nucs_mobile/features/club/views/pages/club_page.dart';
import 'package:nucs_mobile/features/home/view/pages/home_page.dart';
import 'package:nucs_mobile/features/index/view/pages/index_page.dart';

final GlobalKey<NavigatorState> parentNavigatorKey =GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> academicNavigatorKey =GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> blogEstateNavigatorKey =GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> clubNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
          navigatorKey: parentNavigatorKey,
          initialLocation: AppRoutes.homePage,
          routes: [
            StatefulShellRoute.indexedStack(
                builder: (_, __, navShell) =>IndexPage(navigationShell: navShell),
                branches: [
                  StatefulShellBranch(routes: [home]),
                  StatefulShellBranch(routes: [academic]),
                  StatefulShellBranch(routes: [blog]),
                  StatefulShellBranch(routes: [club]),
                ]
              )
          ]);

  static GoRoute home = GoRoute(
    path: AppRoutes.homePath, 
    builder: (context, state) => HomePage()
    );

  static GoRoute academic = GoRoute(
    path: AppRoutes.academicPath, 
    builder: (_, __) => AcademicPage());

  static GoRoute blog = GoRoute(
    path: AppRoutes.blogPath, 
    builder: (_, __) => BlogPage());

  static GoRoute club = GoRoute(
     path: AppRoutes.clubPath,
     builder: (_, __) => ClubPage());
}
