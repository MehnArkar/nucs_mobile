import 'package:dartz/dartz.dart';
import 'package:nucs_mobile/features/contact_us/data/models/contact_request.dart';
import 'package:nucs_mobile/services/firestore_service.dart';
import '../../../../utils/failure.dart';

class ContactRepository {
  final FirestoreService _firestoreService;
  ContactRepository({required FirestoreService firestoreService}): _firestoreService = firestoreService;

  Future<Either<Failure,bool>> contactRequest({required ContactRequest request}) async{
    Either<Failure,bool> apiResult = await _firestoreService.contactRequest(request: request);
    return apiResult.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }

}