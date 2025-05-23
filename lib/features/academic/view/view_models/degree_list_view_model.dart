import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

import '../../../../utils/failure.dart';

class DegreeListViewModel extends Notifier<ViewModelState<List<DegreeProgram>>>{
  final AcademicRepository _academicRepository;
  DegreeListViewModel({required AcademicRepository academicRepository}):_academicRepository = academicRepository;

  @override
  ViewModelState<List<DegreeProgram>> build() {
    getDegreePrograms();
    return ViewModelLoadingState();
  }


  Future<void> getDegreePrograms() async{
    state = ViewModelLoadingState();

    Either<Failure, List<DegreeProgram>> apiResult = await _academicRepository.getDegreePrograms();
    apiResult.fold(
        (failure)=>state = ViewModelFailState(failure),
        (degreeProgram)=> state = ViewModelSuccessState(degreeProgram))
    ;
  }

}