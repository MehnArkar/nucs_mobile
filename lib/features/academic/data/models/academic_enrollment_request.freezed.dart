// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'academic_enrollment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AcademicEnrollmentRequest {
  String get name;
  String get email;
  String get phone;

  /// Create a copy of AcademicEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AcademicEnrollmentRequestCopyWith<AcademicEnrollmentRequest> get copyWith =>
      _$AcademicEnrollmentRequestCopyWithImpl<AcademicEnrollmentRequest>(
          this as AcademicEnrollmentRequest, _$identity);

  /// Serializes this AcademicEnrollmentRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AcademicEnrollmentRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone);

  @override
  String toString() {
    return 'AcademicEnrollmentRequest(name: $name, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class $AcademicEnrollmentRequestCopyWith<$Res> {
  factory $AcademicEnrollmentRequestCopyWith(AcademicEnrollmentRequest value,
          $Res Function(AcademicEnrollmentRequest) _then) =
      _$AcademicEnrollmentRequestCopyWithImpl;
  @useResult
  $Res call({String name, String email, String phone});
}

/// @nodoc
class _$AcademicEnrollmentRequestCopyWithImpl<$Res>
    implements $AcademicEnrollmentRequestCopyWith<$Res> {
  _$AcademicEnrollmentRequestCopyWithImpl(this._self, this._then);

  final AcademicEnrollmentRequest _self;
  final $Res Function(AcademicEnrollmentRequest) _then;

  /// Create a copy of AcademicEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
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
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AcademicEnrollmentRequest implements AcademicEnrollmentRequest {
  _AcademicEnrollmentRequest(
      {required this.name, required this.email, required this.phone});
  factory _AcademicEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AcademicEnrollmentRequestFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;

  /// Create a copy of AcademicEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AcademicEnrollmentRequestCopyWith<_AcademicEnrollmentRequest>
      get copyWith =>
          __$AcademicEnrollmentRequestCopyWithImpl<_AcademicEnrollmentRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AcademicEnrollmentRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AcademicEnrollmentRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone);

  @override
  String toString() {
    return 'AcademicEnrollmentRequest(name: $name, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class _$AcademicEnrollmentRequestCopyWith<$Res>
    implements $AcademicEnrollmentRequestCopyWith<$Res> {
  factory _$AcademicEnrollmentRequestCopyWith(_AcademicEnrollmentRequest value,
          $Res Function(_AcademicEnrollmentRequest) _then) =
      __$AcademicEnrollmentRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email, String phone});
}

/// @nodoc
class __$AcademicEnrollmentRequestCopyWithImpl<$Res>
    implements _$AcademicEnrollmentRequestCopyWith<$Res> {
  __$AcademicEnrollmentRequestCopyWithImpl(this._self, this._then);

  final _AcademicEnrollmentRequest _self;
  final $Res Function(_AcademicEnrollmentRequest) _then;

  /// Create a copy of AcademicEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_AcademicEnrollmentRequest(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
