import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';
import '../../../../config/routing/app_routes.dart';
import '../../data/models/club.dart';

class ClubDetailsPage extends StatelessWidget {
  final Club club;
  const ClubDetailsPage({super.key,required this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Club Details")),
      body: ListView(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        children: [
          Text(club.title,style: context.textTheme().titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: AppDimension.paddingM),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppDimension.borderRadius),
              child: CachedNetworkImage(imageUrl: club.image,fit: BoxFit.fitWidth)),
          SizedBox(height: AppDimension.paddingM),
          Text(club.description)
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
          onPressed: ()=>context.push(AppRoutes.clubEnrollmentPage,extra: club),
          child: Text("Join")),
    );
  }
}
