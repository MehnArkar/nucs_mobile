import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'view_model_state.freezed.dart';

@freezed
sealed class ViewModelState<T> with _$ViewModelState<T>{
  const factory ViewModelState.init() = ViewModelInitState;
  const factory ViewModelState.loading() = ViewModelLoadingState;
  const factory ViewModelState.success(T data) = ViewModelSuccessState;
  const factory ViewModelState.fail(Failure failure) = ViewModelFailState;
}