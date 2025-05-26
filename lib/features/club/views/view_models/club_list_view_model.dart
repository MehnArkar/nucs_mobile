import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/club/data/repository/club_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';
import '../../../../utils/failure.dart';
import '../../data/models/club.dart';

class ClubListViewModel extends Notifier<ViewModelState<List<Club>>>{
  final ClubRepository _clubRepository;
  ClubListViewModel({required ClubRepository blogRepository}):_clubRepository = blogRepository;

  @override
  ViewModelState<List<Club>> build() {
    getClubs();
    return ViewModelLoadingState();
  }


  Future<void> getClubs() async{
    state = ViewModelLoadingState();

    Either<Failure, List<Club>> apiResult = await _clubRepository.getClubs();
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (degreeProgram)=> state = ViewModelSuccessState(degreeProgram))
    ;
  }

}