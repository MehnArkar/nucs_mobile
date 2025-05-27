import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class AcademicListItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function()? onclick;
  const AcademicListItem({super.key,required this.title,required this.description,required this.image, this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimension.borderRadius),
      onTap: onclick,
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
                  child: CachedNetworkImage(imageUrl: image,fit: BoxFit.cover)),
            ),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingM),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: AppDimension.paddingS),
                 Text(title,style: context.textTheme().titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                 SizedBox(height: AppDimension.paddingS),
                 Text(description,style: context.textTheme().bodyMedium,maxLines: 3,overflow: TextOverflow.ellipsis),
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
