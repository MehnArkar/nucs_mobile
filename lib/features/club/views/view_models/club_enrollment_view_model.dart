import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/club/data/models/club_request.dart';
import 'package:nucs_mobile/features/club/data/repository/club_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';
import '../../../../utils/failure.dart';



class ClubEnrollmentViewModel extends AutoDisposeNotifier<ViewModelState<bool>>{
  final ClubRepository _clubRepository;
  ClubEnrollmentViewModel({required ClubRepository clubRepository}):_clubRepository = clubRepository;

  @override
  ViewModelState<bool> build() {
    return ViewModelInitState();
  }

  Future<void> enrollClub(ClubEnrollmentRequest request) async{
    state = ViewModelLoadingState();

    Either<Failure, bool> apiResult = await _clubRepository.enrollClub(enrollment: request);
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (result)=> state = ViewModelSuccessState(result));
  }


}