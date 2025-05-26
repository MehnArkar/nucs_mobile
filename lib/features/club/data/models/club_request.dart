import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_request.g.dart';
part 'club_request.freezed.dart';

@freezed
abstract class ClubEnrollmentRequest with _$ClubEnrollmentRequest{
  factory ClubEnrollmentRequest({
    required String name,
    required String email,
    required String rollNumber,
  }) = _ClubEnrollmentRequest;

  factory ClubEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$ClubEnrollmentRequestFromJson(json);
}