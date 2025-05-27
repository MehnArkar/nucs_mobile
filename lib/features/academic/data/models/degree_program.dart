import 'package:freezed_annotation/freezed_annotation.dart';

part 'degree_program.g.dart';
part 'degree_program.freezed.dart';

@freezed
abstract class DegreeProgram with _$DegreeProgram{
  const factory DegreeProgram({
    required String id,
    required String title,
    required String description,
    required String image
}) = _DegreeProgram;

  factory DegreeProgram.fromJson(Map<String,dynamic> json)=> _$DegreeProgramFromJson(json);
}