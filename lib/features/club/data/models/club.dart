import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.g.dart';
part 'club.freezed.dart';

@freezed
abstract class Club with _$Club{
  const factory Club({
    required String id,
    required String title,
    required String description,
    required String image,
    required int members,
  }) = _Club;

  factory Club.fromJson(Map<String,dynamic> json)=> _$ClubFromJson(json);
}