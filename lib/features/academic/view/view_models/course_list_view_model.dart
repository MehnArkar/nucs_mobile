import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/academic/data/models/course.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

import '../../../../utils/failure.dart';

class CourseListViewModel extends Notifier<ViewModelState<List<Course>>>{
  final AcademicRepository _academicRepository;
  CourseListViewModel({required AcademicRepository academicRepository}):_academicRepository = academicRepository;

  @override
  ViewModelState<List<Course>> build() {
    getCourses();
    return ViewModelLoadingState();
  }


  Future<void> getCourses() async{
    state = ViewModelLoadingState();

    Either<Failure, List<Course>> apiResult = await _academicRepository.getCourses();
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (degreeProgram)=> state = ViewModelSuccessState(degreeProgram))
    ;
  }

}