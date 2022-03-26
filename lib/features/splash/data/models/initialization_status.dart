import 'package:freezed_annotation/freezed_annotation.dart';
part 'initialization_status.freezed.dart';

@freezed
class InitializationStatus with _$InitializationStatus {
  factory InitializationStatus({
    @Default(false) bool getItInitialized,
  }) = _InitializationStatus;

  InitializationStatus._();

  List<bool> get statuses => [getItInitialized];
}
