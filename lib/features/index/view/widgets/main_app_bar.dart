import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_constants.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "${AppConstants.imagesPath}/nucs_mono_logo.png",
        width: context.sw() * 0.25),
      centerTitle: false,
      backgroundColor: context.colorScheme().primary
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, kToolbarHeight);
}
