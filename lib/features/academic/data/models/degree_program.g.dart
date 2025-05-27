// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DegreeProgram _$DegreeProgramFromJson(Map<String, dynamic> json) =>
    _DegreeProgram(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$DegreeProgramToJson(_DegreeProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
