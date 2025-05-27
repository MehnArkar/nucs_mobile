import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucs_mobile/config/constants/app_constants.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar({super.key, 
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      backgroundColor: context.colorScheme().surfaceBright,
      selectedItemColor: context.colorScheme().primary,
      unselectedItemColor: context.colorScheme().onSurface,
      selectedIconTheme: IconThemeData(color: context.colorScheme().primary),
      unselectedIconTheme: IconThemeData(color: context.colorScheme().onSurface),
      selectedLabelStyle: context.textTheme().bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: context.textTheme().bodyMedium,
      items: _buildNavigationItems(context),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems(BuildContext context) {
    final navigationItems = [
      _NavItem(
        label: 'Home',
        iconPath: '${AppConstants.iconsPath}/home.svg',
        index: 0,
      ),
      _NavItem(
        label: 'Academic',
        iconPath: '${AppConstants.iconsPath}/academic.svg',
        index: 1,
      ),
      _NavItem(
        label: 'Blog',
        iconPath: '${AppConstants.iconsPath}/blog.svg',
        index: 2,
      ),
      _NavItem(
        label: 'Clubs',
        iconPath: '${AppConstants.iconsPath}/club.svg',
        index: 3,
      ),
    ];

    return navigationItems.map((item) => item.toNavigationBarItem(
      context: context,
      currentIndex: currentIndex,
    )).toList();
  }
}

class _NavItem {
  final String label;
  final String iconPath;
  final int index;

  const _NavItem({
    required this.label,
    required this.iconPath,
    required this.index,
  });

  BottomNavigationBarItem toNavigationBarItem({
    required BuildContext context,
    required int currentIndex,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        iconPath,
        color: currentIndex == index 
          ? context.colorScheme().primary 
          : context.colorScheme().onSurface,
      ),
    );
  }
}