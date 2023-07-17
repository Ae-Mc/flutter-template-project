import 'package:flutter_template_project/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template_project/features/splash/data/models/initialization_status.dart';
import 'package:flutter_template_project/features/splash/domain/repositories/startup_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template_project/features/splash/data/repositories/startup_repository_impl.config.dart';

@InjectableInit(initializerName: "init", preferRelativeImports: false)
class StartupRepositoryImpl implements StartupRepository {
  InitializationStatus initializationStatus = InitializationStatus();

  @override
  bool get isInitialized {
    return initializationStatus.statuses.every((element) => element);
  }

  @override
  Future<Either<List<Failure>, void>> initialize() =>
      initializeAllNotInitialized();

  @override
  Future<Either<List<Failure>, void>> retryInitialization() =>
      initializeAllNotInitialized();

  Future<Either<List<Failure>, void>> initializeAllNotInitialized() async {
    List<Failure> failures = [];
    if (!initializationStatus.getItInitialized) {
      initializationStatus = initializationStatus.copyWith(
        getItInitialized: (await initializeGetIt()).fold(
          (l) {
            failures.add(l);

            return false;
          },
          (r) => true,
        ),
      );
    }

    return failures.isEmpty ? const Right(null) : Left(failures);
  }

  Future<Either<Failure, void>> initializeGetIt() async {
    try {
      // ignore: avoid-ignoring-return-values
      await GetIt.I.init();
    } catch (_) {
      return const Left(Failure.unknownFailure());
    }

    return const Right(null);
  }
}
