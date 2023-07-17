import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_result_bloc/single_result_bloc.dart';
import 'package:flutter_template_project/core/failure.dart';
import 'package:flutter_template_project/features/splash/domain/repositories/startup_repository.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc
    extends SingleResultBloc<SplashEvent, SplashState, SplashSingleResult> {
  final StartupRepository repository;

  SplashBloc(this.repository) : super(const SplashState.loading()) {
    on(handleEvent);
  }

  Future<void> handleEvent(SplashEvent event, Emitter<SplashState> emit) async {
    emit(const SplashState.loading());

    handleInitializationResult(
      await event.when(
        initialize: () => repository.initialize(),
        retryInitialization: () => repository.retryInitialization(),
      ),
      emit,
    );
  }

  void handleInitializationResult(
    Either<List<Failure>, void> result,
    Emitter<SplashState> emit,
  ) {
    return result.fold(
      (l) {
        final displayedFailure = l.first;
        emit(SplashState.failure(displayedFailure));
        addSingleResult(SplashSingleResult.failure(displayedFailure));
      },
      (r) => emit(const SplashState.initialized()),
    );
  }
}
