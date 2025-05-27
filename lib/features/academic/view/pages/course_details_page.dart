import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

import '../../../../config/routing/app_routes.dart';
import '../../data/models/course.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;
  const CourseDetailsPage({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Details")),
      body: ListView(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        children: [
          Text(course.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppDimension.paddingM),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              child: CachedNetworkImage(imageUrl: course.image,fit: BoxFit.fitWidth)),
          SizedBox(height: AppDimension.paddingM),
          Text(course.description)
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }


  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(AppDimension.paddingPage),
      child: ElevatedButton(
          onPressed: ()=>context.push(AppRoutes.courseEnrollmentPage,extra: course),
          child: Text("Enroll")),
    );
  }
}
