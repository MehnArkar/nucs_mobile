import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_constants.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme().surface,
      child: Column(
        children: [
          _coverPhoto(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingPage,vertical: AppDimension.paddingPage),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppDimension.paddingM,
              children: [
                DrawerItem(
                    iconName: "about.svg",
                    label: "About Us",
                    onClick: (){
                      context.pop();
                      context.push(AppRoutes.contactUsPage);
                    }
                ),
                DrawerItem(
                    iconName: "send.svg",
                    label: "Contact Us",
                    onClick: (){
                      context.pop();
                      context.push(AppRoutes.contactUsPage);
                    }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _coverPhoto() {
    return AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset("${AppConstants.imagesPath}/nucs_full_logo.jpg",
            fit: BoxFit.cover));
  }
}

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String label;
  final void Function()? onClick;
  const DrawerItem({super.key, required this.iconName, required this.label,this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingM, vertical: AppDimension.paddingS),
        decoration: BoxDecoration(
          color: context.colorScheme().surfaceBright,
          borderRadius: BorderRadius.circular(AppDimension.borderRadius)
          ),
        child: Row(
          children: [
            SvgPicture.asset("${AppConstants.iconsPath}/$iconName"),
            SizedBox(width: AppDimension.paddingS),
            Expanded(child: Text(label,style: context.textTheme().bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
            Icon(Icons.arrow_forward_ios_rounded,size: 18,color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
