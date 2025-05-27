import 'package:dartz/dartz.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/services/firestore_service.dart';

import '../../../../utils/failure.dart';

class BlogRepository {
  final FirestoreService _firestoreService;
  BlogRepository({required FirestoreService firestoreService}): _firestoreService = firestoreService;

  Future<Either<Failure, List<Blog>>> getBlogs() async {
    Either<Failure, List<Map<String, dynamic>>> apiResult = await _firestoreService.getBlogs();
    return apiResult.fold(
          (failure) => left(failure),
          (dataList) => right(dataList.map((data) => Blog.fromJson(data)).toList()),
    );
  }

}