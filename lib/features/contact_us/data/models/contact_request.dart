import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_request.g.dart';
part 'contact_request.freezed.dart';

@freezed
abstract class ContactRequest with _$ContactRequest{
  factory ContactRequest({
    required String name,
    required String email,
    required String message,
  }) = _ContactRequest;

  factory ContactRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestFromJson(json);
}