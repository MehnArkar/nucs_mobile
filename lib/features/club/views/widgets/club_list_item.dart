import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

import '../../data/models/club.dart';

class ClubListItem extends StatelessWidget {
  final Club club;
  const ClubListItem({super.key,required this.club});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimension.borderRadius),
      onTap: ()=>context.push(AppRoutes.clubDetailsPage,extra: club),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimension.borderRadius)),
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimension.borderRadius),
                topRight: Radius.circular(AppDimension.borderRadius),
              ),
              child: AspectRatio(
                  aspectRatio: 16/9,
                  child: CachedNetworkImage(imageUrl: club.image,fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingM),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimension.paddingS),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(club.title,style: context.textTheme().titleSmall?.copyWith(fontWeight: FontWeight.w700),maxLines: 2,overflow: TextOverflow.ellipsis),
                            Text("${club.members} members",style: context.textTheme().bodyMedium?.copyWith(color: context.colorScheme().primary,fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: ()=>context.push(AppRoutes.clubEnrollmentPage,extra: club),
                          child: Text("Join")
                      )
                    ],
                  ),
                  SizedBox(height: AppDimension.paddingS),
                  Text(club.description,style: context.textTheme().bodyMedium,maxLines: 3,overflow: TextOverflow.ellipsis),
                  SizedBox(height: AppDimension.paddingS),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
