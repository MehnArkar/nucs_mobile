// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactRequest {
  String get name;
  String get email;
  String get message;

  /// Create a copy of ContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContactRequestCopyWith<ContactRequest> get copyWith =>
      _$ContactRequestCopyWithImpl<ContactRequest>(
          this as ContactRequest, _$identity);

  /// Serializes this ContactRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContactRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, message);

  @override
  String toString() {
    return 'ContactRequest(name: $name, email: $email, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ContactRequestCopyWith<$Res> {
  factory $ContactRequestCopyWith(
          ContactRequest value, $Res Function(ContactRequest) _then) =
      _$ContactRequestCopyWithImpl;
  @useResult
  $Res call({String name, String email, String message});
}

/// @nodoc
class _$ContactRequestCopyWithImpl<$Res>
    implements $ContactRequestCopyWith<$Res> {
  _$ContactRequestCopyWithImpl(this._self, this._then);

  final ContactRequest _self;
  final $Res Function(ContactRequest) _then;

  /// Create a copy of ContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? message = null,
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
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ContactRequest implements ContactRequest {
  _ContactRequest(
      {required this.name, required this.email, required this.message});
  factory _ContactRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String message;

  /// Create a copy of ContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactRequestCopyWith<_ContactRequest> get copyWith =>
      __$ContactRequestCopyWithImpl<_ContactRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, message);

  @override
  String toString() {
    return 'ContactRequest(name: $name, email: $email, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ContactRequestCopyWith<$Res>
    implements $ContactRequestCopyWith<$Res> {
  factory _$ContactRequestCopyWith(
          _ContactRequest value, $Res Function(_ContactRequest) _then) =
      __$ContactRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String email, String message});
}

/// @nodoc
class __$ContactRequestCopyWithImpl<$Res>
    implements _$ContactRequestCopyWith<$Res> {
  __$ContactRequestCopyWithImpl(this._self, this._then);

  final _ContactRequest _self;
  final $Res Function(_ContactRequest) _then;

  /// Create a copy of ContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? message = null,
  }) {
    return _then(_ContactRequest(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
