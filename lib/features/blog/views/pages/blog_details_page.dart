import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';
import '../../../../config/routing/app_routes.dart';

class BlogDetailsPage extends StatelessWidget {
  final Blog blog;
  const BlogDetailsPage({super.key,required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog Details")),
      body: ListView(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        children: [
          Text(blog.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppDimension.paddingS),
          Text(DateFormat("MMM dd yyyy").format(DateTime.parse(blog.createdAt)),style: context.textTheme().bodySmall?.copyWith(color: Colors.grey,fontWeight: FontWeight.w500)),
          SizedBox(height: AppDimension.paddingM),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              child: CachedNetworkImage(imageUrl: blog.image,fit: BoxFit.fitWidth)),
          SizedBox(height: AppDimension.paddingM),
          Text(blog.description)
        ],
      ),
    );
  }


}
