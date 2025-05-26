// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Blog _$BlogFromJson(Map<String, dynamic> json) => _Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$BlogToJson(_Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt,
    };
