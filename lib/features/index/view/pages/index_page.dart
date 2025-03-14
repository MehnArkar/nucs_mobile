import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_constants.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class IndexPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const IndexPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _bottomNavBar(context),
    );
  }


  Widget _bottomNavBar(BuildContext context){
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: (index)=>navigationShell.goBranch(index),
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      backgroundColor:context.colorScheme().surfaceBright ,
      selectedItemColor: context.colorScheme().primary,
      unselectedItemColor: context.colorScheme().onSurface,
      selectedIconTheme: IconThemeData(color: context.colorScheme().primary),
      unselectedIconTheme: IconThemeData(color: context.colorScheme().onSurface),
      selectedLabelStyle: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      unselectedLabelStyle: context.textTheme().bodySmall,
    
      items: [
        BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset("${AppConstants.iconsPath}/home.svg",color: navigationShell.currentIndex==0 ? context.colorScheme().primary : context.colorScheme().onSurface)
          ),
          BottomNavigationBarItem(
            label: "Academic",
            icon: SvgPicture.asset("${AppConstants.iconsPath}/academic.svg",color: navigationShell.currentIndex==1 ? context.colorScheme().primary : context.colorScheme().onSurface)
          ),
          BottomNavigationBarItem(
            label: "Blog",
            icon: SvgPicture.asset("${AppConstants.iconsPath}/blog.svg",color: navigationShell.currentIndex==2 ? context.colorScheme().primary : context.colorScheme().onSurface)
          ),
          BottomNavigationBarItem(
            label: "Clubs",
            icon: SvgPicture.asset("${AppConstants.iconsPath}/club.svg",color: navigationShell.currentIndex==3 ? context.colorScheme().primary : context.colorScheme().onSurface)
          )

      ]
      );
  }

  
}
