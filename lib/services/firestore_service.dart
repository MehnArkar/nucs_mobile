import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nucs_mobile/features/club/data/models/club_request.dart';
import 'package:nucs_mobile/features/contact_us/data/models/contact_request.dart';
import 'package:nucs_mobile/utils/failure.dart';
import '../features/academic/data/models/academic_enrollment_request.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;
  FirestoreService({required FirebaseFirestore firestore}) : _firestore = firestore ;
  
  // Collection names as static constants
  static const String _degreeCollection = "degree";
  static const String _courseCollection = "course";
  static const String _degreeEnrollmentCollection = "degree_enrollment";
  static const String _courseEnrollmentCollection = "course_enrollment";
  static const String _blogCollection = "blogs";
  static const String _clubCollection = "club";
  static const String _clubEnrollmentCollection = "club_enrollment";
  static const String _contactCollection = "contact_requests";

  // Generic CRUD operations
  Future<Either<Failure, List<Map<String, dynamic>>>> getCollection(String collection) async {
    try {
      final snapshot = await _firestore.collection(collection).get();
      final dataList = snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data()
      }).toList();
      return right(dataList);
    } catch (e) {
      return left(SystemFailure(e.toString()));
    }
  }


  // Domain-specific methods
  Future<Either<Failure, List<Map<String, dynamic>>>> getDegreePrograms() async {
    return getCollection(_degreeCollection);
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getCourses() async {
    return getCollection(_courseCollection);
  }

  Future<Either<Failure,bool>> enrollDegreeProgram({required AcademicEnrollmentRequest enrollment}) async{
    try {
      CollectionReference degreeEnrollmentReference = FirebaseFirestore.instance.collection(_degreeEnrollmentCollection);
      await degreeEnrollmentReference.add(enrollment.toJson());
      return right(true);
    }catch(e){
      return left(SystemFailure(e.toString()));
    }
  }

  Future<Either<Failure,bool>> enrollCourse({required AcademicEnrollmentRequest enrollment}) async{
    try {
      CollectionReference courseEnrollmentCollection = FirebaseFirestore.instance.collection(_courseEnrollmentCollection);
      await courseEnrollmentCollection.add(enrollment.toJson());
      return right(true);
    }catch(e){
      return left(SystemFailure(e.toString()));
    }

  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getBlogs() async {
    return getCollection(_blogCollection);
  }

  Future<Either<Failure,List<Map<String,dynamic>>>> getClubs()async{
    return getCollection(_clubCollection);
  }

  Future<Either<Failure,bool>> enrollClub({required ClubEnrollmentRequest enrollment}) async{
    try {
      CollectionReference clubEnrollmentCollection = FirebaseFirestore.instance.collection(_clubEnrollmentCollection);
      await clubEnrollmentCollection.add(enrollment.toJson());
      return right(true);
    }catch(e){
      return left(SystemFailure(e.toString()));
    }
  }

  Future<Either<Failure,bool>> contactRequest({required ContactRequest request}) async{
    try {
      CollectionReference contactCollectionRef = FirebaseFirestore.instance.collection(_contactCollection);
      await contactCollectionRef.add(request.toJson());
      return right(true);
    }catch(e){
      return left(SystemFailure(e.toString()));
    }
  }

}
