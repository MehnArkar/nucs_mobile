import 'package:dartz/dartz.dart';
import 'package:nucs_mobile/features/club/data/models/club.dart';
import 'package:nucs_mobile/features/club/data/models/club_request.dart';
import 'package:nucs_mobile/services/firestore_service.dart';
import '../../../../utils/failure.dart';

class ClubRepository {
  final FirestoreService _firestoreService;
  ClubRepository({required FirestoreService firestoreService}): _firestoreService = firestoreService;

  Future<Either<Failure, List<Club>>> getClubs() async {
    Either<Failure, List<Map<String, dynamic>>> apiResult = await _firestoreService.getClubs();
    return apiResult.fold(
          (failure) => left(failure),
          (dataList) => right(dataList.map((data) => Club.fromJson(data)).toList()),
    );
  }

  Future<Either<Failure,bool>> enrollClub({required ClubEnrollmentRequest enrollment}) async{
    Either<Failure,bool> apiResult = await _firestoreService.enrollClub(enrollment: enrollment);
    return apiResult.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }

}