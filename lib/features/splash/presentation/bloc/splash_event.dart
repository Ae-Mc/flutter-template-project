import 'package:flutter_template_project/core/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_event.freezed.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.initialize() = SplashEventInitialize;
  const factory SplashEvent.retryInitialization() =
      SplashEventRetryInitialization;
}

@freezed
class SplashSingleResult with _$SplashSingleResult {
  const factory SplashSingleResult.failure(Failure failure) =
      SplashSingleResultFailure;
}
