import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/contact_us/data/models/contact_request.dart';
import 'package:nucs_mobile/features/contact_us/data/repository/contact_repository.dart';
import 'package:nucs_mobile/features/contact_us/data/repository/contact_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';
import '../../../../utils/failure.dart';



class ContactRequestViewModel extends AutoDisposeNotifier<ViewModelState<bool>>{
  final ContactRepository _contactRepository;
  ContactRequestViewModel({required ContactRepository clubRepository}):_contactRepository = clubRepository;

  @override
  ViewModelState<bool> build() {
    return ViewModelInitState();
  }

  Future<void> contact(ContactRequest request) async{
    state = ViewModelLoadingState();

    Either<Failure, bool> apiResult = await _contactRepository.contactRequest(request: request);
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (result)=> state = ViewModelSuccessState(result));
  }


}