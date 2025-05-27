// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'degree_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DegreeProgram {
  String get id;
  String get title;
  String get description;
  String get image;

  /// Create a copy of DegreeProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DegreeProgramCopyWith<DegreeProgram> get copyWith =>
      _$DegreeProgramCopyWithImpl<DegreeProgram>(
          this as DegreeProgram, _$identity);

  /// Serializes this DegreeProgram to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DegreeProgram &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, image);

  @override
  String toString() {
    return 'DegreeProgram(id: $id, title: $title, description: $description, image: $image)';
  }
}

/// @nodoc
abstract mixin class $DegreeProgramCopyWith<$Res> {
  factory $DegreeProgramCopyWith(
          DegreeProgram value, $Res Function(DegreeProgram) _then) =
      _$DegreeProgramCopyWithImpl;
  @useResult
  $Res call({String id, String title, String description, String image});
}

/// @nodoc
class _$DegreeProgramCopyWithImpl<$Res>
    implements $DegreeProgramCopyWith<$Res> {
  _$DegreeProgramCopyWithImpl(this._self, this._then);

  final DegreeProgram _self;
  final $Res Function(DegreeProgram) _then;

  /// Create a copy of DegreeProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DegreeProgram implements DegreeProgram {
  const _DegreeProgram(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});
  factory _DegreeProgram.fromJson(Map<String, dynamic> json) =>
      _$DegreeProgramFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  /// Create a copy of DegreeProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DegreeProgramCopyWith<_DegreeProgram> get copyWith =>
      __$DegreeProgramCopyWithImpl<_DegreeProgram>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DegreeProgramToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DegreeProgram &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, image);

  @override
  String toString() {
    return 'DegreeProgram(id: $id, title: $title, description: $description, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$DegreeProgramCopyWith<$Res>
    implements $DegreeProgramCopyWith<$Res> {
  factory _$DegreeProgramCopyWith(
          _DegreeProgram value, $Res Function(_DegreeProgram) _then) =
      __$DegreeProgramCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, String description, String image});
}

/// @nodoc
class __$DegreeProgramCopyWithImpl<$Res>
    implements _$DegreeProgramCopyWith<$Res> {
  __$DegreeProgramCopyWithImpl(this._self, this._then);

  final _DegreeProgram _self;
  final $Res Function(_DegreeProgram) _then;

  /// Create a copy of DegreeProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_DegreeProgram(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
