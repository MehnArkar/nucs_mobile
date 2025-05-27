import 'package:dartz/dartz.dart';
import 'package:nucs_mobile/features/academic/data/models/course.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/services/firestore_service.dart';
import 'package:nucs_mobile/utils/failure.dart';

import '../models/academic_enrollment_request.dart';

class AcademicRepository {
  final FirestoreService _firestoreService;
  AcademicRepository({required FirestoreService firestoreService}):_firestoreService = firestoreService;

  Future<Either<Failure, List<DegreeProgram>>> getDegreePrograms() async {
    Either<Failure, List<Map<String, dynamic>>> apiResult = await _firestoreService.getDegreePrograms();
    return apiResult.fold(
          (failure) => left(failure),
          (dataList) => right(dataList.map((data) => DegreeProgram.fromJson(data)).toList()),
    );
  }


  Future<Either<Failure, List<Course>>> getCourses() async {
    Either<Failure, List<Map<String, dynamic>>> apiResult = await _firestoreService.getCourses();
    return apiResult.fold(
          (failure) => left(failure),
          (dataList) => right(dataList.map((data) => Course.fromJson(data)).toList()),
    );
  }

  Future<Either<Failure,bool>> enrollDegreeProgram({required AcademicEnrollmentRequest enrollment}) async{
    Either<Failure,bool> apiResult = await _firestoreService.enrollDegreeProgram(enrollment: enrollment);
    return apiResult.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }

  Future<Either<Failure,bool>> enrollCourseProgram({required AcademicEnrollmentRequest enrollment}) async{
    Either<Failure,bool> apiResult = await _firestoreService.enrollCourse(enrollment: enrollment);
    return apiResult.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }

}