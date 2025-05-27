import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.g.dart';
part 'course.freezed.dart';

@freezed
abstract class Course with _$Course{
  const factory Course({
    required String id,
    required String title,
    required String description,
    required String image
  }) = _Course;

  factory Course.fromJson(Map<String,dynamic> json)=> _$CourseFromJson(json);
}