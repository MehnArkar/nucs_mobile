// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClubEnrollmentRequest _$ClubEnrollmentRequestFromJson(
        Map<String, dynamic> json) =>
    _ClubEnrollmentRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      rollNumber: json['rollNumber'] as String,
    );

Map<String, dynamic> _$ClubEnrollmentRequestToJson(
        _ClubEnrollmentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'rollNumber': instance.rollNumber,
    };
