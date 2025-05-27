import 'package:freezed_annotation/freezed_annotation.dart';

part 'academic_enrollment_request.g.dart';
part 'academic_enrollment_request.freezed.dart';

@freezed
abstract class AcademicEnrollmentRequest with _$AcademicEnrollmentRequest{
  factory AcademicEnrollmentRequest({
    required String name,
    required String email,
    required String phone,
  }) = _AcademicEnrollmentRequest;

  factory AcademicEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AcademicEnrollmentRequestFromJson(json);
}