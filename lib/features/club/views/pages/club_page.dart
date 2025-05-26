import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/club/views/view_models/club_list_view_model.dart';
import 'package:nucs_mobile/features/club/views/widgets/club_list_item.dart';
import '../../../../core/injector.dart';
import '../../../../utils/view_model_state.dart';
import '../../data/models/club.dart';

final blogListViewModel = NotifierProvider<ClubListViewModel, ViewModelState<List<Club>>>(() {
  return ClubListViewModel(blogRepository: injector.get());
});



class ClubPage extends ConsumerWidget{
  const ClubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogViewModelState = ref.watch(blogListViewModel);
    return Scaffold(
      body: switch (blogViewModelState) {
        ViewModelLoadingState() => const Center(child: CircularProgressIndicator()),
        ViewModelFailState failure => Center(child: Text(failure.failure.message)),
        ViewModelSuccessState<List<Club>> success => _buildClubList(success.data),
        _=>SizedBox.shrink()
      },
    );
  }

  Widget _buildClubList(List<Club> clubs){
    return ListView.separated(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        itemBuilder: (context,index)=>ClubListItem(club: clubs[index]),
        separatorBuilder: (context,index)=>SizedBox(height: AppDimension.paddingM),
        itemCount: clubs.length);
  }
}