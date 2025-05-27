import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog.g.dart';
part 'blog.freezed.dart';

@freezed
abstract class Blog with _$Blog{
  const factory Blog({
    required String id,
    required String title,
    required String description,
    required String image,
    @JsonKey(name: "created_at")required String createdAt,
  }) = _Blog;

  factory Blog.fromJson(Map<String,dynamic> json)=> _$BlogFromJson(json);
}