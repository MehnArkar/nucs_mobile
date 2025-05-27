import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/features/index/view/widgets/bottom_nav_bar.dart';
import 'package:nucs_mobile/features/index/view/widgets/main_app_bar.dart';
import 'package:nucs_mobile/features/index/view/widgets/main_drawer.dart';


class IndexPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  
  const IndexPage({
    super.key, 
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      endDrawer: MainDrawer(),
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}

