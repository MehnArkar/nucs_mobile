// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_model_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewModelState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ViewModelState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ViewModelState<$T>()';
  }
}

/// @nodoc
class $ViewModelStateCopyWith<T, $Res> {
  $ViewModelStateCopyWith(
      ViewModelState<T> _, $Res Function(ViewModelState<T>) __);
}

/// @nodoc

class ViewModelInitState<T> implements ViewModelState<T> {
  const ViewModelInitState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ViewModelInitState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ViewModelState<$T>.init()';
  }
}

/// @nodoc

class ViewModelLoadingState<T> implements ViewModelState<T> {
  const ViewModelLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ViewModelLoadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ViewModelState<$T>.loading()';
  }
}

/// @nodoc

class ViewModelSuccessState<T> implements ViewModelState<T> {
  const ViewModelSuccessState(this.data);

  final T data;

  /// Create a copy of ViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewModelSuccessStateCopyWith<T, ViewModelSuccessState<T>> get copyWith =>
      _$ViewModelSuccessStateCopyWithImpl<T, ViewModelSuccessState<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewModelSuccessState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ViewModelState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ViewModelSuccessStateCopyWith<T, $Res>
    implements $ViewModelStateCopyWith<T, $Res> {
  factory $ViewModelSuccessStateCopyWith(ViewModelSuccessState<T> value,
          $Res Function(ViewModelSuccessState<T>) _then) =
      _$ViewModelSuccessStateCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ViewModelSuccessStateCopyWithImpl<T, $Res>
    implements $ViewModelSuccessStateCopyWith<T, $Res> {
  _$ViewModelSuccessStateCopyWithImpl(this._self, this._then);

  final ViewModelSuccessState<T> _self;
  final $Res Function(ViewModelSuccessState<T>) _then;

  /// Create a copy of ViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ViewModelSuccessState<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ViewModelFailState<T> implements ViewModelState<T> {
  const ViewModelFailState(this.failure);

  final Failure failure;

  /// Create a copy of ViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewModelFailStateCopyWith<T, ViewModelFailState<T>> get copyWith =>
      _$ViewModelFailStateCopyWithImpl<T, ViewModelFailState<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewModelFailState<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'ViewModelState<$T>.fail(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $ViewModelFailStateCopyWith<T, $Res>
    implements $ViewModelStateCopyWith<T, $Res> {
  factory $ViewModelFailStateCopyWith(ViewModelFailState<T> value,
          $Res Function(ViewModelFailState<T>) _then) =
      _$ViewModelFailStateCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$ViewModelFailStateCopyWithImpl<T, $Res>
    implements $ViewModelFailStateCopyWith<T, $Res> {
  _$ViewModelFailStateCopyWithImpl(this._self, this._then);

  final ViewModelFailState<T> _self;
  final $Res Function(ViewModelFailState<T>) _then;

  /// Create a copy of ViewModelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(ViewModelFailState<T>(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
