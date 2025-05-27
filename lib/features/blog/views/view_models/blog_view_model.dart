import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/features/blog/data/repository/blog_repository.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

import '../../../../utils/failure.dart';

class BlogListViewModel extends Notifier<ViewModelState<List<Blog>>>{
  final BlogRepository _blogRepository;
  BlogListViewModel({required BlogRepository blogRepository}):_blogRepository = blogRepository;

  @override
  ViewModelState<List<Blog>> build() {
    getBlogs();
    return ViewModelLoadingState();
  }


  Future<void> getBlogs() async{
    state = ViewModelLoadingState();

    Either<Failure, List<Blog>> apiResult = await _blogRepository.getBlogs();
    apiResult.fold(
            (failure)=>state = ViewModelFailState(failure),
            (degreeProgram)=> state = ViewModelSuccessState(degreeProgram))
    ;
  }

}