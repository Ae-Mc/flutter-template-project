import 'package:flutter_template_project/app/router/app_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RouterModule {
  @lazySingleton
  AppRouter appRouter() => AppRouter();
}
