import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;
  const BlogListItem({super.key,required this.blog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimension.borderRadius),
      onTap: ()=>context.push(AppRoutes.blogDetailsPage,extra: blog),
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
                  child: CachedNetworkImage(imageUrl: blog.image,fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingM),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimension.paddingS),
                  Text(blog.title,style: context.textTheme().titleSmall?.copyWith(fontWeight: FontWeight.w700),maxLines: 2,overflow: TextOverflow.ellipsis),
                  Text(DateFormat("MMM dd yyyy").format(DateTime.parse(blog.createdAt)),style: context.textTheme().bodySmall?.copyWith(color: Colors.grey,fontWeight: FontWeight.w500)),
                  SizedBox(height: AppDimension.paddingS),
                  Text(blog.description,style: context.textTheme().bodyMedium,maxLines: 3,overflow: TextOverflow.ellipsis),
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
