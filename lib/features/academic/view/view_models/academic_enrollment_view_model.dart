import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/academic/data/models/academic_enrollment_request.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

import '../../../../utils/failure.dart';



class AcademicEnrollmentViewModel extends AutoDisposeNotifier<ViewModelState<bool>>{
  final AcademicRepository _academicRepository;
  AcademicEnrollmentViewModel({required AcademicRepository academicRepository}):_academicRepository = academicRepository;

  @override
  ViewModelState<bool> build() {
    return ViewModelInitState();
  }

  Future<void> enrollDegreeProgram(AcademicEnrollmentRequest request) async{
    state = ViewModelLoadingState();

    Either<Failure, bool> apiResult = await _academicRepository.enrollDegreeProgram(enrollment: request);
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (result)=> state = ViewModelSuccessState(result));
  }

  Future<void> enrollCourse(AcademicEnrollmentRequest request) async{
    state = ViewModelLoadingState();

    Either<Failure, bool> apiResult = await _academicRepository.enrollCourseProgram(enrollment: request);
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (result)=> state = ViewModelSuccessState(result));
  }


}