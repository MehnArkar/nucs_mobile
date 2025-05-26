import 'package:get_it/get_it.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/features/blog/data/repository/blog_repository.dart';
import 'package:nucs_mobile/features/club/data/repository/club_repository.dart';
import 'package:nucs_mobile/services/firestore_service.dart';

GetIt injector = GetIt.instance;


class ServiceLocator {
  static Future<void> injectDependencies() async {
    await _injectServices();
    await _injectRepositories();
  }

  static Future<void> _injectServices()async{
    injector.registerLazySingleton(()=>FirestoreService());
  }

  static Future<void> _injectRepositories()async{
    injector.registerLazySingleton(()=>AcademicRepository(firestoreService: injector.get()));
    injector.registerLazySingleton(()=>BlogRepository(firestoreService: injector.get()));
    injector.registerLazySingleton(()=>ClubRepository(firestoreService: injector.get()));
  }
}