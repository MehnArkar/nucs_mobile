// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClubEnrollmentRequest {
  String get name;
  String get email;
  String get rollNumber;

  /// Create a copy of ClubEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClubEnrollmentRequestCopyWith<ClubEnrollmentRequest> get copyWith =>
      _$ClubEnrollmentRequestCopyWithImpl<ClubEnrollmentRequest>(
          this as ClubEnrollmentRequest, _$identity);

  /// Serializes this ClubEnrollmentRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClubEnrollmentRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rollNumber, rollNumber) ||
                other.rollNumber == rollNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, rollNumber);

  @override
  String toString() {
    return 'ClubEnrollmentRequest(name: $name, email: $email, rollNumber: $rollNumber)';
  }
}

/// @nodoc
abstract mixin class $ClubEnrollmentRequestCopyWith<$Res> {
  factory $ClubEnrollmentRequestCopyWith(ClubEnrollmentRequest value,
          $Res Function(ClubEnrollmentRequest) _then) =
      _$ClubEnrollmentRequestCopyWithImpl;
  @useResult
  $Res call({String name, String email, String rollNumber});
}

/// @nodoc
class _$ClubEnrollmentRequestCopyWithImpl<$Res>
    implements $ClubEnrollmentRequestCopyWith<$Res> {
  _$ClubEnrollmentRequestCopyWithImpl(this._self, this._then);

  final ClubEnrollmentRequest _self;
  final $Res Function(ClubEnrollmentRequest) _then;

  /// Create a copy of ClubEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? rollNumber = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      rollNumber: null == rollNumber
          ? _self.rollNumber
          : rollNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ClubEnrollmentRequest implements ClubEnrollmentRequest {
  _ClubEnrollmentRequest(
      {required this.name, required this.email, required this.rollNumber});
  factory _ClubEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$ClubEnrollmentRequestFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String rollNumber;

  /// Create a copy of ClubEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClubEnrollmentRequestCopyWith<_ClubEnrollmentRequest> get copyWith =>
      __$ClubEnrollmentRequestCopyWithImpl<_ClubEnrollmentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClubEnrollmentRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClubEnrollmentRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rollNumber, rollNumber) ||
                other.rollNumber == rollNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, rollNumber);

  @override
  String toString() {
    return 'ClubEnrollmentRequest(name: $name, email: $email, rollNumber: $rollNumber)';
  }
}

/// @nodoc
abstract mixin class _$ClubEnrollmentRequestCopyWith<$Res>
    implements $ClubEnrollmentRequestCopyWith<$Res> {
  factory _$ClubEnrollmentRequestCopyWith(_ClubEnrollmentRequest value,
          $Res Function(_ClubEnrollmentRequest) _then) =
      __$ClubEnrollmentRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email, String rollNumber});
}

/// @nodoc
class __$ClubEnrollmentRequestCopyWithImpl<$Res>
    implements _$ClubEnrollmentRequestCopyWith<$Res> {
  __$ClubEnrollmentRequestCopyWithImpl(this._self, this._then);

  final _ClubEnrollmentRequest _self;
  final $Res Function(_ClubEnrollmentRequest) _then;

  /// Create a copy of ClubEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? rollNumber = null,
  }) {
    return _then(_ClubEnrollmentRequest(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      rollNumber: null == rollNumber
          ? _self.rollNumber
          : rollNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
