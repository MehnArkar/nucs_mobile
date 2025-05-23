import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/features/academic/data/models/course.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/view/pages/academic_page.dart';
import 'package:nucs_mobile/features/academic/view/pages/course_details_page.dart';
import 'package:nucs_mobile/features/academic/view/pages/course_enrollment_page.dart';
import 'package:nucs_mobile/features/academic/view/pages/degree_program_details_page.dart';
import 'package:nucs_mobile/features/academic/view/pages/degree_program_enrollment_page.dart';
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
    builder: (_, __) => AcademicPage(),
    routes: [
      degreeProgramDetailsRoute,
      courseDetailsRoute
    ]
  );

  static GoRoute blog = GoRoute(
    path: AppRoutes.blogPath, 
    builder: (_, __) => BlogPage());

  static GoRoute club = GoRoute(
     path: AppRoutes.clubPath,
     builder: (_, __) => ClubPage());

  static GoRoute degreeProgramDetailsRoute = GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: AppRoutes.degreeProgramDetailsPath,
      builder: (_,state)=>DegreeProgramDetailsPage(degreeProgram: state.extra as DegreeProgram),
      routes: [
        degreeProgramEnrollmentRoute
      ]
  );

  static GoRoute courseDetailsRoute = GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: AppRoutes.courseDetailsPath,
      builder: (_,state)=>CourseDetailsPage(course: state.extra as Course),
      routes: [
        courseEnrollmentRoute
      ]
  );

  static GoRoute degreeProgramEnrollmentRoute = GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: AppRoutes.degreeProgramEnrollmentPath,
      builder: (_,state)=>DegreeProgramEnrollmentPage(degreeProgram: state.extra as DegreeProgram)
  );

  static GoRoute courseEnrollmentRoute = GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: AppRoutes.courseEnrollmentPath,
      builder: (_,state)=>CourseEnrollmentPage(course: state.extra as Course)
  );
}
