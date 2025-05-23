import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class DegreeProgramDetailsPage extends StatelessWidget {
  final DegreeProgram degreeProgram;
  const DegreeProgramDetailsPage({super.key,required this.degreeProgram});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Program Details")),
      body: ListView(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        children: [
          Text(degreeProgram.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppDimension.paddingM),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              child: CachedNetworkImage(imageUrl: degreeProgram.image,fit: BoxFit.fitWidth)),
          SizedBox(height: AppDimension.paddingM),
          Text(degreeProgram.description)
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
          onPressed: ()=>context.push(AppRoutes.degreeProgramEnrollmentPage,extra: degreeProgram),
          child: Text("Enroll")),
    );
  }

}
