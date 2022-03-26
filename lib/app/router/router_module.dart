import 'package:injectable/injectable.dart';
import 'package:flutter_template_project/app/router/app_router.gr.dart';

@module
abstract class RouterModule {
  @singleton
  AppRouter appRouter() => AppRouter();
}
