import 'package:flutter_template_project/core/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = SplashStateLoading;
  const factory SplashState.failure(Failure failure) = SplashStateFailure;
  const factory SplashState.initialized() = SplashStateInitialized;
}
